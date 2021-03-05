*SimulationStudio-Base-controlling
insertOn: exceptionHandler do: aBlock

	^ self insertSender: (self class
		contextOn: exceptionHandler
		do: aBlock)