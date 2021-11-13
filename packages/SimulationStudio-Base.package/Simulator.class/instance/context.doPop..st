controlling
context: aContext doPop: aBlock
	<capability: #pop>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext doPop: aBlock]
		ifNil: [aBlock value]