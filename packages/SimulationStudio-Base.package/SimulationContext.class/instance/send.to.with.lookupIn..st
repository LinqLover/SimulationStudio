controlling
send: selector to: rcvr with: arguments lookupIn: lookupClass
	"Simulate the action of sending a message with selector and arguments to rcvr. The argument, lookupClass, is the class in which to lookup the message. This is the receiver's class for normal messages, but for super messages it will be some specific class related to the source method."

	| meth |
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
	
	^ self
		executeMethod: meth
		forSelector: selector
		withArgs: arguments
		receiver: rcvr