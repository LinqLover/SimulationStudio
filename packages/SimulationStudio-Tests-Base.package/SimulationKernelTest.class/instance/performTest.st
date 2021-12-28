running
performTest

	testSelector isSymbol ifTrue: [^ super performTest].
	
	thisContext simCustomizationLevel isZero ifTrue: [
		self flag: #workaround. "Critical sections not yet supported in Sandbox execution. See: https://github.com/LinqLover/SimulationStudio/issues/19"
		Transcript showln: 'Running test '; show: self].
	
	^ self
		shouldNotChange: [thisContext simCustomizationLevel]
		after: [self basicPerformTest]