instruction processing
context: aContext doMethodReturnTop: aBlock
	<capability: #methodReturnTop>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext doMethodReturnTop: aBlock]
		ifNil: [aBlock value]