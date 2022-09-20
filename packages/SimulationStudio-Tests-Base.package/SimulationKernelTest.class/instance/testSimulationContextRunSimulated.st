tests - nested simulation
testSimulationContextRunSimulated

	self assert: 2 / 3 equals:
		(SimulationContext runSimulated: [2 / 3]).