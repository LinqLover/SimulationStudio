instruction processing
context: aContext pushConstant: value do: aBlock
	<capability: #pushConstant:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext pushConstant: value do: aBlock]
		ifNil: [aBlock value: value]