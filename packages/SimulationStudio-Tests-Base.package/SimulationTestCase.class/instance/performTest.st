running
performTest

	self flag: #workaround. "ct: https://github.com/hpi-swa/smalltalkCI/issues/481"
	thisContext simCustomizationLevel isZero ifTrue: [
		self flag: #workaround. "Critical sections not yet supported in Sandbox execution. See: https://github.com/LinqLover/SimulationStudio/issues/19"
		Transcript showln: 'Running test '; show: self].
	
	^ self
		shouldNotChange: [thisContext simCustomizationLevel]
		after: [super performTest]