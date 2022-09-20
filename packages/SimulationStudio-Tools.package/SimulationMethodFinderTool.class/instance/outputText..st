accessing
outputText: aStringOrText

	(self outputText: aStringOrText requestor: nil)
		ifTrue: [self changed: #outputText].