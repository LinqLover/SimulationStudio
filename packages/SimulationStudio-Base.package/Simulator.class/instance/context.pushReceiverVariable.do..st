instruction processing
context: aContext pushReceiverVariable: offset do: aBlock
	<capability: #pushReceiverVariable:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext pushReceiverVariable: offset do: aBlock]
		ifNil: [aBlock value: offset]