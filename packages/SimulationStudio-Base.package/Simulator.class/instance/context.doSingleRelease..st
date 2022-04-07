controlling
context: aContext doSingleRelease: aBlock
	<capability: #singleRelease>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext doSingleRelease: aBlock]
		ifNil: [aBlock value]