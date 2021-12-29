recording
basicSimulate: simulatedBlock do: simulatorBlock chain: simulatorArray

	^ [super
		basicSimulate: simulatedBlock
		do: simulatorBlock
		chain: simulatorArray]
			valueAndStoreTimeToRun: [:duration | timeToRun := duration]