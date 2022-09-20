accessing - toolbuilder
aboutToStyle: styler requestor: requestor

	styler context:
		(requestor knownName
			caseOf:
				{[#inputsText] -> [].
				[#outputText] ->
					[(self searchMode
						caseOf:
							{[#predicate] -> [self makeContextForPredicate].
							[#sendingPredicate] -> [self makeContextForSendingPredicate]}
						otherwise: [])]}
			otherwise:
				[self selection ifNil: [^ false].
				^ super aboutToStyle: styler requestor: requestor]).
	
	styler parseAMethod: false.
	styler workspace: self.
	
	^ true