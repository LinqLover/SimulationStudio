instruction processing
context: aContext pushSpecialConstant: value do: aBlock
	<capability: #pushSpecialConstant:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext pushSpecialConstant: value do: aBlock]
		ifNil: [aBlock value: value]