instruction processing
context: aContext doBlockReturnTop: aBlock
	<capability: #blockReturnTop>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext doBlockReturnTop: aBlock]
		ifNil: [aBlock value]