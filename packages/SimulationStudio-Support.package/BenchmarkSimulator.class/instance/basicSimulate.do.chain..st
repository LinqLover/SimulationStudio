recording
basicSimulate: simulatedBlock do: simulatorBlock chain: simulatorArray

	| result |
	timeToRun := [result := super
		basicSimulate: simulatedBlock
		do: simulatorBlock
		chain: simulatorArray] timeToRun milliSeconds.
	^ result