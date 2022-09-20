running
tearDown

	[window ifNotNil: #abandon.
	finder ifNotNil:
		[finder containingWindow ifNotNil: #abandon]]
			valueSuppressingMessages: #('*cancel those changes*').
	
	^ super tearDown