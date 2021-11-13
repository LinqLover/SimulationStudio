instruction processing
context: aContext callPrimitive: primNumber do: aBlock
	<capability: #callPrimitive:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext callPrimitive: primNumber do: aBlock]
		ifNil: [aBlock value: primNumber]