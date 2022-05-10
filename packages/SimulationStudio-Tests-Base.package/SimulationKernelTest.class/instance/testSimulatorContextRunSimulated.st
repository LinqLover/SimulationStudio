tests - nested simulation
testSimulatorContextRunSimulated

	self assert: 2 / 3 equals:
		(Simulator evaluate: [2 / 3]).