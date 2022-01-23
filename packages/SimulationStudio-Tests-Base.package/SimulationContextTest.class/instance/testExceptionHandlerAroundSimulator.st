tests
testExceptionHandlerAroundSimulator

	| error |
	[SimulationContext runSimulated: [Error new tag: self; signal]]
		on: Error
		do: [:ex | error := ex].
	self
		assert: error notNil;
		assert: self identical: error tag.
	
	self
		assert: 42
		equals: ([SimulationContext runSimulated: [self error]]
			on: Error
			do: [:ex | ex resumeUnchecked: 42]).