instruction processing
context: aContext popIntoLiteralVariable: value do: aBlock
	<capability: #popIntoLiteralVariable:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext popIntoLiteralVariable: value do: aBlock]
		ifNil: [aBlock value: value]