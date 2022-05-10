tests - nested simulation
testContextRunSimulated

	self assert: 2 / 3 equals:
		(Context runSimulated: [2 / 3]).