instruction processing
context: aContext pushConsArrayWithElements: numElements do: aBlock
	<capability: #pushConsArrayWithElements:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext pushConsArrayWithElements: numElements do: aBlock]
		ifNil: [aBlock value: numElements]