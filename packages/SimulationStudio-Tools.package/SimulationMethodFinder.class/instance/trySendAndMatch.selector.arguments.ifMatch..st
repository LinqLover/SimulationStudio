finding
trySendAndMatch: receiver selector: selector arguments: arguments ifMatch: resultBlock

	| matchedResults |
	matchedResults := self
		sandboxedDo:
			[self searchMode = #sendingPredicate
				ifFalse:
					[| result |
					result := receiver perform: selector withArguments: arguments.
					(self matchesResult: result)
						ifTrue: [{result}]]
				ifTrue:
					[(predicate value:
						(MessageSend
							receiver: receiver
							selector: selector
							arguments: arguments))
						ifTrue: [{nil}]]]
		ifFailed: [nil].
	
	matchedResults ifNotNil:
		[^ resultBlock value: matchedResults first].
	
	^ nil