instruction processing
context: aContext storeIntoTemporaryVariable: offset do: aBlock
	<capability: #storeIntoTemporaryVariable:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext storeIntoTemporaryVariable: offset do: aBlock]
		ifNil: [aBlock value: offset]