tests
testContextClass

	self executionTests do: [:selector |
		self perform: selector with: [:block |
			SimulationContext
				runSimulated: block
				contextAtEachStep: [:ctx |
					self assert: SimulationContext equals: ctx class]]].