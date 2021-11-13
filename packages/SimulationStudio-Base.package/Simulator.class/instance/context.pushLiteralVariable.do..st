instruction processing
context: aContext pushLiteralVariable: value do: aBlock
	<capability: #pushLiteralVariable:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext pushLiteralVariable: value do: aBlock]
		ifNil: [aBlock value: value]