evaluating
basicSimulate: simulatedBlock do: simulatorBlock chain: simulatorArray

	| result |
	self recorder
		setMessageSend: [result := super
			basicSimulate: simulatedBlock
			do: simulatorBlock
			chain: simulatorArray];
		basicRecord.
	^ result