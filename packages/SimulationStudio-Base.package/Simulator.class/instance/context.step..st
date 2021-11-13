controlling
context: aContext step: aBlock
	<capability: #step>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext step: aBlock]
		ifNil: [aBlock value]