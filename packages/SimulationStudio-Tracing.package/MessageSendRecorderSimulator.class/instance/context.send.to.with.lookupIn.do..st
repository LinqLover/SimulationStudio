controlling
context: aContext send: selector to: receiver with: arguments lookupIn: lookupClass do: aBlock

	| result |
	(lookupClass lookupSelector: selector) ifNotNil: [:method |
		self recordSendMethod: method receiver: receiver arguments: arguments context: aContext].
	
	result := super context: aContext send: selector to: receiver with: arguments lookupIn: lookupClass do: aBlock.
	
	result == aContext ifTrue: [
		self recordReturn: result top to: aContext].
	
	^ result