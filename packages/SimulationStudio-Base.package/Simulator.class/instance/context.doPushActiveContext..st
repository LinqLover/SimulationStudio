instruction processing
context: aContext doPushActiveContext: aBlock
	<capability: #pushActiveContext>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext doPushActiveContext: aBlock]
		ifNil: [aBlock value]