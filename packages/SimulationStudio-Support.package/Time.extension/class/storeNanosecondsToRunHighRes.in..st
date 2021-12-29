*SimulationStudio-Support-general inquiries
storeNanosecondsToRunHighRes: timedBlock in: storeBlock

	| ticks |
	ticks := self highResClock.
	^ timedBlock ensure: [
		storeBlock value: (self highResClock - ticks
			+ (self highResClock - self highResClock ) "subtract the ticks taken by the call to highResClock itself"
			* 1e6 // self highResClockTicksPerMillisecond) "and convert ticks to nanoSeconds"]