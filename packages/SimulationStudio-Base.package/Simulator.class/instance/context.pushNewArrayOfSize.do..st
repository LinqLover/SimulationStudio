instruction processing
context: aContext pushNewArrayOfSize: arraySize do: aBlock
	<capability: #pushNewArrayOfSize:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext pushNewArrayOfSize: arraySize do: aBlock]
		ifNil: [aBlock value: arraySize]