instruction processing
context: aContext doMethodReturnReceiver: aBlock
	<capability: #methodReturnReceiver>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext doMethodReturnReceiver: aBlock]
		ifNil: [aBlock value]