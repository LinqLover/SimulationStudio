*SimulationStudio-Support-general inquiries
storeMillisecondsToRun: timedBlock in: storeBlock

	^ self
		storeNanosecondsToRun: timedBlock
		in: [:nanos | storeBlock value: nanos + 500 // 1000]