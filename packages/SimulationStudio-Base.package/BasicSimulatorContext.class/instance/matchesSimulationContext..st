testing
matchesSimulationContext: aSimulationContext

	^ (super matchesSimulationContext: aSimulationContext)
		and: [aSimulationContext simulator == simulator]