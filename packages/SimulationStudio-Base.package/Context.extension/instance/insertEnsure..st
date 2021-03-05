*SimulationStudio-Base-controlling
insertEnsure: aBlock

	^ self insertSender: (self class contextEnsure: aBlock)