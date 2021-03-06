controlling
send: selector to: rcvr with: arguments lookupIn: lookupClass

	| meth |
	(meth := lookupClass lookupSelector: selector) ifNil:
		[selector == #doesNotUnderstand: ifTrue:
			[self error: 'Recursive message not understood!' translated].
		^self send: #doesNotUnderstand:
				to: rcvr
				with: {(Message selector: selector arguments: arguments) lookupClass: lookupClass}
				lookupIn: lookupClass].
	
	currentReceiver := rcvr.
	currentArguments := arguments.
	currentRecord := recorder
		recordSendMethod: meth
		receiver: rcvr
		arguments: arguments
		context: self.
	
	^ super send: selector to: rcvr with: arguments lookupIn: lookupClass