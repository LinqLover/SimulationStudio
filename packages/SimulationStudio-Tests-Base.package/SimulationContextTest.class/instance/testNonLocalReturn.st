tests
testNonLocalReturn

	| result |
	result := SimulationContext
		runSimulated: [[^ 1] on: Error do: []]
		contextAtEachStep: [:x | x].
	self assert: 1 equals: result.