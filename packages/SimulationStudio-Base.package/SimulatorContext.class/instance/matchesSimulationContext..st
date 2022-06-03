testing
matchesSimulationContext: aSimulationContext

	^ (aSimulationContext isMemberOf: self class)
		and: [aSimulationContext simulator matchesSimulator: simulator]