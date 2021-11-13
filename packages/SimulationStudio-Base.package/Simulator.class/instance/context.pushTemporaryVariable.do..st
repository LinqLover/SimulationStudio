instruction processing
context: aContext pushTemporaryVariable: offset do: aBlock
	<capability: #pushTemporaryVariable:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext pushTemporaryVariable: offset do: aBlock]
		ifNil: [aBlock value: offset]