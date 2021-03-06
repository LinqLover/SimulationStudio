running
performTest

	testSelector isSymbol ifTrue: [^ super performTest].
	^ self
		shouldNotChange: [thisContext simCustomizationLevel]
		after: [self basicPerformTest]