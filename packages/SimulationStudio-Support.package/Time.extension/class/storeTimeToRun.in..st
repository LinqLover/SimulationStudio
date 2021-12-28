*SimulationStudio-Support-general inquiries
storeTimeToRun: timedBlock in: storeBlock

	^ self
		storeMillisecondsToRun: timedBlock
		in: [:millis | storeBlock value: millis milliSeconds]