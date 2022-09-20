finding
trySend: receiver selector: selector arguments: arguments ifSuccess: resultBlock

	| results |
	results := self
		sandboxedDo:
			[{receiver perform: selector withArguments: arguments}]
		ifFailed: [nil].
	
	results ifNotNil:
		[^ resultBlock value: results first].
	
	^ nil