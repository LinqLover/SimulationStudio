controlling
send: selector to: rcvr with: arguments lookupIn: lookupClass
	"Simulate the action of sending a message with selector and arguments to rcvr. The argument, lookupClass, is the class in which to lookup the message. This is the receiver's class for normal messages, but for super messages it will be some specific class related to the source method."

	| meth methClass primIndex val ctxt |
	"+++ CHANGE +++"
	self flag: #moveUpstream.
	(meth := self lookupSelector: selector inClass: lookupClass) ifNil:
	"--- CHANGE ---"
		[selector == #doesNotUnderstand: ifTrue:
			[self error: 'Recursive message not understood!' translated].
		^self send: #doesNotUnderstand:
				to: rcvr
				with: {(Message selector: selector arguments: arguments) lookupClass: lookupClass}
				lookupIn: lookupClass].
	
	((methClass := self objectClass: meth) == CompiledMethod or: [methClass == CompiledBlock]) ifFalse:
		["Object as Methods (OaM) protocol: 'The contract is that, when the VM encounters an ordinary object (rather than a compiled method) in the method dictionary during lookup, it sends it the special selector #run:with:in: providing the original selector, arguments, and receiver.'. DOI: 10.1145/2991041.2991062."
		^self send: #run:with:in:
			to: meth
			with: {selector. arguments. rcvr}].
	
	meth numArgs = arguments size ifFalse:
		[^ self error: ('Wrong number of arguments in simulated message {1}' translated format: {selector})].
	(primIndex := meth primitive) > 0 ifTrue:
		[val := self doPrimitive: primIndex method: meth receiver: rcvr args: arguments.
		(self isPrimFailToken: val) ifFalse:
			[^val]].
	
	ctxt := self activateMethod: meth withArgs: arguments receiver: rcvr.
	(primIndex isInteger and: [primIndex > 0]) ifTrue:
		[ctxt failPrimitiveWith: val].
	
	^ctxt