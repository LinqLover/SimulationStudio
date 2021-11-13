instruction processing
context: aContext storeIntoReceiverVariable: offset do: aBlock
	<capability: #storeIntoReceiverVariable:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext storeIntoReceiverVariable: offset do: aBlock]
		ifNil: [aBlock value: offset]