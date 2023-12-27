*SimulationStudio-Base-private-override
doPrimitive: primitiveIndex method: meth receiver: receiver args: arguments
	"Simulate a primitive method whose index is primitiveIndex.  The simulated receiver and
	 arguments are given as arguments to this message. If successful, push result and return
	 resuming context, else ^ {errCode, PrimitiveFailToken}. Any primitive which provokes
	 execution needs to be intercepted and simulated to avoid execution running away."

	| value |
	"Judicious use of primitive 19 (a null primitive that doesn't do anything) prevents
	 the debugger from entering various run-away activities such as spawning a new
	 process, etc.  Injudicious use results in the debugger not being able to debug
	 interesting code, such as the debugger itself.  Hence use primitive 19 with care :-)"
	"SystemNavigation new browseAllSelect: [:m| m primitive = 19]"
	primitiveIndex = 19 ifTrue: [
		[self notify: ('The code being simulated is trying to control a process ({1}). Process controlling cannot be simulated. If you proceed, things may happen outside the observable area of the simulator.' translated format: {meth reference})]
			ifCurtailed: [self push: nil "Cheap fix of the context's internal state"]].
	
	((primitiveIndex between: 201 and: 222)
	 and: [(self objectClass: receiver) includesBehavior: BlockClosure]) ifTrue:
		[(primitiveIndex = 206
		  or: [primitiveIndex = 208]) ifTrue:						"[Full]BlockClosure>>valueWithArguments:"
			[^receiver simulateValueWithArguments: arguments first caller: self].
		 ((primitiveIndex between: 201 and: 209)			 "[Full]BlockClosure>>value[:value:...]"
		  or: [primitiveIndex between: 221 and: 222]) ifTrue: "[Full]BlockClosure>>valueNoContextSwitch[:]"
			[^receiver simulateValueWithArguments: arguments caller: self]].

	primitiveIndex = 83 ifTrue: "afr 9/11/1998 19:50" "Object>>perform:[with:...]"
		[| selector |
		selector := arguments at: 1 ifAbsent:
			[^ self class primitiveFailTokenFor: #'bad argument'].
		arguments size - 1 = selector numArgs ifFalse:
			[^ self class primitiveFailTokenFor: #'bad number of arguments'].
		^self send: selector to: receiver with: arguments allButFirst].
	primitiveIndex = 84 ifTrue: "afr 9/11/1998 19:50 & eem 8/18/2009 17:04" "Object>>perform:withArguments:"
		[| selector args |
		arguments size = 2 ifFalse:
			[^ self class primitiveFailTokenFor: #'bad argument'].
		selector := arguments first.
		args := arguments second.
		args isArray ifFalse:
			[^ self class primitiveFailTokenFor: #'bad argument'].
		args size = selector numArgs ifFalse:
			[^ self class primitiveFailTokenFor: #'bad number of arguments'].
		^self send: selector to: receiver with: args].
	primitiveIndex = 100 ifTrue: "eem 8/18/2009 16:57" "Object>>perform:withArguments:inSuperclass:"
		[| rcvr selector args superclass |
		arguments size
			caseOf: {
				[3] -> [
					rcvr := receiver.
					selector := arguments first.
					args := arguments second.
					superclass := arguments third].
				[4] -> ["mirror primitive"
					rcvr := arguments first.
					selector := arguments second.
					args := arguments third.
					superclass := arguments fourth] }
			otherwise: [^ self class primitiveFailTokenFor: #'bad number of arguments'].
		args isArray ifFalse:
			[^ self class primitiveFailTokenFor: #'bad argument'].
		args size = selector numArgs ifFalse:
			[^ self class primitiveFailTokenFor: #'bad number of arguments'].
		((self objectClass: rcvr) includesBehavior: superclass) ifFalse:
			[^ self class primitiveFailTokenFor: #'bad argument'].
		^self send: selector to: rcvr with: args lookupIn: superclass].

	"Mutex>>primitiveEnterCriticalSection
	 Mutex>>primitiveTestAndSetOwnershipOfCriticalSection"
	(primitiveIndex = 186 or: [primitiveIndex = 187]) ifTrue:
		[| effective |
		 effective := Processor activeProcess effectiveProcess.
		 "active == effective"
		 value := primitiveIndex = 186
					ifTrue: [receiver primitiveEnterCriticalSectionOnBehalfOf: effective]
					ifFalse: [receiver primitiveTestAndSetOwnershipOfCriticalSectionOnBehalfOf: effective].
		 ^(self isPrimFailToken: value)
			ifTrue: [value]
			ifFalse: [self push: value]].

	primitiveIndex = 188 ifTrue:	"Object>>withArgs:executeMethod:
									CompiledMethod class>>receiver:withArguments:executeMethod:
									VMMirror>>ifFail:object:with:executeMethod: et al"
		[| n args methodArg thisReceiver |
		 ((n := arguments size) between: 2 and: 4) ifFalse:
			[^self class primitiveFailTokenFor: #'unsupported operation'].
		 ((self objectClass: (args := arguments at: n - 1)) == Array
		  and: [(self objectClass: (methodArg := arguments at: n)) includesBehavior: CompiledMethod]) ifFalse:
			[^self class primitiveFailTokenFor: #'bad argument'].
		 methodArg numArgs = args size ifFalse:
			[^self class primitiveFailTokenFor: #'bad number of arguments'].
		 thisReceiver := arguments at: n - 2 ifAbsent: [receiver].
		 methodArg primitive > 0 ifTrue:
			[methodArg isQuick ifTrue:
				[^self push: (methodArg valueWithReceiver: thisReceiver arguments: args)].
			 ^self doPrimitive: methodArg primitive method: methodArg receiver: thisReceiver args: args]. "<-- SimulationStudio: backported from Kernel-ct.1487 (required for smalltalkCI coverage wrappers)"
		 ^self
			activateMethod: methodArg
			withArgs: args
			receiver: thisReceiver].

	primitiveIndex = 118 ifTrue: "[receiver:]tryPrimitive:withArgs:; avoid recursing in the VM"
		[(arguments size = 3
		  and: [(self objectClass: arguments second) == SmallInteger
		  and: [(self objectClass: arguments last) == Array]]) ifTrue:
			[^self doPrimitive: arguments second method: meth receiver: arguments first args: arguments last].
		 (arguments size = 2
		 and: [(self objectClass: arguments first) == SmallInteger
		 and: [(self objectClass: arguments last) == Array]]) ifFalse:
			[^self class primitiveFailTokenFor: nil].
		 ^self doPrimitive: arguments first method: meth receiver: receiver args: arguments last].

	value := primitiveIndex = 120 "FFI method"
				ifTrue: [(meth literalAt: 1) tryInvokeWithArguments: arguments]
				ifFalse:
					[primitiveIndex = 117 "named primitives"
						ifTrue: [self tryNamedPrimitiveIn: meth for: receiver withArgs: arguments]
						ifFalse: "should use self receiver: receiver tryPrimitive: primitiveIndex withArgs: arguments but this is only in later VMs (and appears to be broken)"
							[receiver tryPrimitive: primitiveIndex withArgs: arguments]].

	^(self isPrimFailToken: value)
		ifTrue: [value]
		ifFalse: [self push: value]