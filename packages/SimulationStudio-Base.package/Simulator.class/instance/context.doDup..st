instruction processing
context: aContext doDup: aBlock
	<capability: #doDup>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext doDup: aBlock]
		ifNil: [aBlock value]