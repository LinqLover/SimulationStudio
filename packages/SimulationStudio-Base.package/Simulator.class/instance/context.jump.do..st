instruction processing
context: aContext jump: distance do: aBlock
	<capability: #jump:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext jump: distance do: aBlock]
		ifNil: [aBlock value: distance]