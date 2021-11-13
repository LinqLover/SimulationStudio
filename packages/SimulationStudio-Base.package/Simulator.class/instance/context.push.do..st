controlling
context: aContext push: anObject do: aBlock
	<capability: #push:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext push: anObject do: aBlock]
		ifNil: [aBlock value: anObject]