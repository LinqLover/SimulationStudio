accessing
inputsText: aStringOrText

	(self inputsText: aStringOrText requestor: nil)
		ifTrue: [self changed: #inputsText].