instruction processing
context: aContext storeIntoLiteralVariable: value do: aBlock
	<capability: #storeIntoLiteralVariable:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext storeIntoLiteralVariable: value do: aBlock]
		ifNil: [aBlock value: value]