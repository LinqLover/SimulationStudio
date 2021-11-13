instruction processing
context: aContext methodReturnConstant: value do: aBlock
	<capability: #methodReturnConstant:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext methodReturnConstant: value do: aBlock]
		ifNil: [aBlock value: value]