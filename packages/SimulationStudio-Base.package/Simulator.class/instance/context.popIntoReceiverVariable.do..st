instruction processing
context: aContext popIntoReceiverVariable: offset do: aBlock
	<capability: #popIntoReceiverVariable:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext popIntoReceiverVariable: offset do: aBlock]
		ifNil: [aBlock value: offset]