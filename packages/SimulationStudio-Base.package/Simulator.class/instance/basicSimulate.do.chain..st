private
basicSimulate: simulatedBlock do: simulatorBlock chain: simulatorArray
	"Hook for subclasses which should decorate their logic around a super send to this method."

	nextSimulator ifNotNil: [
		^ nextSimulator basicSimulate: simulatedBlock do: simulatorBlock chain: (simulatorArray copyWith: nextSimulator)].
	
	^ simulatorBlock value: simulatedBlock value: simulatorArray