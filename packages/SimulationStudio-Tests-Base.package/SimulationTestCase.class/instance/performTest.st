running
performTest

	self flag: #workaround. "ct: https://github.com/hpi-swa/smalltalkCI/issues/481"
	Transcript showln: 'Running test '; show: self.
	
	^ self
		shouldNotChange: [thisContext simCustomizationLevel]
		after: [super performTest]