tests
testReturnFromBottom

	| context |
	context := SimulationContext newFrom: [] asContext.
	
	self assert: context step isNil.