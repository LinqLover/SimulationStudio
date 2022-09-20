accessing - toolbuilder
inputsText: aStringOrText requestor: requestor

	| arrayText inputs |
	arrayText := ('\{{1}\}' as: aStringOrText species) format: {aStringOrText}.
	
	inputs := self compilerClass new
		evaluate: arrayText
		in: nil
		to: nil
		notifying: requestor
		ifFail: [^ false].
	inputsText := aStringOrText.
	
	finder receiverAndArguments: (inputs ifEmpty: [nil]).
	
	self
		checkForUnacceptedEditsIn: #outputText
		ifTrueAcceptDeferredAnd: [^ true].
	
	self findMethods.
	
	^ true