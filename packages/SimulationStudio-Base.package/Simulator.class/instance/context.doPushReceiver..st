instruction processing
context: aContext doPushReceiver: aBlock
	<capability: #pushReceiver>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext doPushReceiver: aBlock]
		ifNil: [aBlock value]