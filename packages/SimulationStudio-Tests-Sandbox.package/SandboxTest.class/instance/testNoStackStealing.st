tests
testNoStackStealing
	<timeout: 15 "seconds">

	| sandbox |
	sandbox := self sandboxClass new.
	sandbox stepLimit: 1000000.
	
	[sandbox class disableLoggingAndNotifyingDuringCompilation:
		[sandbox evaluate: 
			[Context compile: 'resume: value through: firstUnwindCtxt
	| ctxt unwindBlock |
	value stepLimit: 9000000. "<-- stack stealing!"
	self isDead ifTrue: [self cannotReturn: value to: self].
	ctxt := firstUnwindCtxt.
	[ctxt isNil] whileFalse:
		[(ctxt tempAt: 2) ifNil:
			[ctxt tempAt: 2 put: true.
			 unwindBlock := ctxt tempAt: 1.
			 thisContext terminateTo: ctxt.
			 unwindBlock value].
		 ctxt := ctxt findNextUnwindContextUpTo: self].
	thisContext terminateTo: self.
	^value'.
			^ thisContext sandboxForTests]]]
				on: SandboxError do: [].
	
	self assert: 1000000 equals: sandbox stepLimit.