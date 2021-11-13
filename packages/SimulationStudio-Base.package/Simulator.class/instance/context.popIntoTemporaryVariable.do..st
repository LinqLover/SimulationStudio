instruction processing
context: aContext popIntoTemporaryVariable: offset do: aBlock
	<capability: #popIntoTemporaryVariable:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext popIntoTemporaryVariable: offset do: aBlock]
		ifNil: [aBlock value: offset]