instruction processing
context: aContext doDup: aBlock
	<capability: #dup>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext doDup: aBlock]
		ifNil: [aBlock value]