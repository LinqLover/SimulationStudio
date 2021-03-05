running
performTest

	^ self
		shouldNotChange: [thisContext simCustomizationLevel]
		after: [super performTest]