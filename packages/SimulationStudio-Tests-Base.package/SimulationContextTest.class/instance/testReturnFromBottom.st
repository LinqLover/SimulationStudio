tests
testReturnFromBottom

	| context |
	context := SimulationContext newFrom: [] asContext.
	
	self assert: (context sender isNil and: [context willReturn]).