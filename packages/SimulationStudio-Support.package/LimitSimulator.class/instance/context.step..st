controlling
context: aContext step: aBlock

	stepCount := stepCount + 1.
	stepCount >= stepLimit ifTrue: [
		SimulatorLimitExceeded signal].
	
	^ super context: aContext step: aBlock