controlling
context: aContext step: aBlock

	stepCount := stepCount + 1.
	stepCount >= stepLimit ifTrue: [
		SimulatorLimitExceeded signalForContext: aContext].
	
	^ super context: aContext step: aBlock