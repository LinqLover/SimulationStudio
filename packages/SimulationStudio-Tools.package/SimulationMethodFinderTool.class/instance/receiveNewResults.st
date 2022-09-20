updating
receiveNewResults

	| newResults |
	newResults := Array streamContents: [:stream |
		| method |
		[method := resultQueue nextOrNil] whileNotNil:
			[stream nextPut: method]].
	newResults ifNotEmpty:
		[messageList addAll:
			(newResults collect: [:result | result methodReference]).
		self changed: #messageList].