private
warn: aString

	thisContext simCustomizationLevel isZero ifTrue:
		[self flag: #workaround. "Critical sections not yet supported in Sandbox execution. See: https://github.com/LinqLover/SimulationStudio/issues/19"
		Transcript showln: aString].