*SimulationStudio-Support-general inquiries
storeNanosecondsToRun: timedBlock in: storeBlock

	| startUsecs |
	(self useHighResClockForTiming and: [self highResClock ~= 0])
		ifTrue: [	^ self storeNanosecondsToRunHighRes: timedBlock in: [:nanos | timedBlock value: nanos + 500 // 1000]].
	startUsecs := self utcMicrosecondClock.
	^ timedBlock ensure: [storeBlock value: self utcMicrosecondClock - startUsecs]