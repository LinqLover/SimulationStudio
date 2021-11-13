instruction processing
context: aContext blockReturnConstant: value do: aBlock
	<capability: #blockReturnConstant:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext blockReturnConstant: value do: aBlock]
		ifNil: [aBlock value: value]