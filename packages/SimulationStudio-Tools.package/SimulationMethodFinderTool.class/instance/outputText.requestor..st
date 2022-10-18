accessing - toolbuilder
outputText: aStringOrText requestor: requestor

	self resetOutput.
	self searchMode caseOf:
		{[#value] ->
			[finder expectedAnswer:
				(self compilerClass new
					evaluate: aStringOrText
					in: nil
					to: nil
					notifying: requestor
					ifFail: [^ false])].
		[#predicate] ->
			[| predicateMethod |
			predicateMethod := self compilerClass new
				compiledMethodFor: aStringOrText
				in: self makeContextForPredicate
				to: nil
				notifying: requestor
				ifFail: [^ false].
			finder predicate: [:result |
				predicateMethod valueWithReceiver: nil arguments:
					{self pseudoContextForPredicateWith: result}]].
		[#sendingPredicate] ->
			[| predicateMethod |
			bindings := externalBindings copy.
			predicateMethod := self compilerClass new
				compiledMethodFor: aStringOrText
				in: self makeContextForSendingPredicate
				to: nil
				notifying: requestor
				ifFail: [^ false].
			finder predicate: [:messageSend |
				predicateMethod valueWithReceiver: nil arguments:
					{self pseudoContextForPredicateWith: messageSend}].
			self prepareSendingPredicate ifFalse:
				[| missingExpression |
				missingExpression := 'messageSend value'.
				self inform: ('Your predicate does not evaluate the message send. Make sure that it contains the following expression:\\{1}' withCRs asText format:
					{((TextStyler for: #Smalltalk)
						ifNotNil: [:stylerClass |
							stylerClass new
								in: [:styler | self aboutToStyle: styler requestor: requestor];
								styledTextFor: missingExpression asText]
						ifNil: [missingExpression])
							asText
								addAttribute: (TextIndent tabs: 1);
								yourself})].
			self changed: #style.
			"Make sure inputs are recompiled for the new bindings"
			(self dependentTextPaneWithSelector: #inputsText) ifNotNil: [:m |
				m hasUnacceptedEdits: true]]}.
	outputText := aStringOrText.
	
	self
		checkForUnacceptedEditsIn: #inputsText
		ifTrueAcceptDeferredAnd: [^ true].
	
	self findMethods.
	
	^ true