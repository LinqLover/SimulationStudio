instruction processing
context: aContext jump: distance if: condition do: aBlock
	<capability: #jump:if:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext jump: distance if: condition do: aBlock]
		ifNil: [aBlock value: distance value: condition]