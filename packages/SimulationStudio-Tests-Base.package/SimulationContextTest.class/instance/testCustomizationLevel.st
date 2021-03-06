tests
testCustomizationLevel

	| level0 |
	level0 := thisContext simCustomizationLevel. "this allows us to run the test transparently in a Sandbox 🤓"
	SimulationContext runSimulated: [
		 | level1 |
		level1 := thisContext simCustomizationLevel.
		self assert: level0 + 1 equals: level1.
		SimulationContext runSimulated: [
			| level2 |
			level2 := thisContext simCustomizationLevel.
			self assert: level1 + 1 equals: level2].
		self assert: level1 equals: thisContext simCustomizationLevel].
	self assert: level0 equals: thisContext simCustomizationLevel.