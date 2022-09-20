running
tearDown

	[window ifNotNil: #abandon.
	explorer ifNotNil:
		[explorer containingWindow ifNotNil: #abandon]]
			valueSuppressingMessages: #('*cancel those changes*').
	
	^ super tearDown