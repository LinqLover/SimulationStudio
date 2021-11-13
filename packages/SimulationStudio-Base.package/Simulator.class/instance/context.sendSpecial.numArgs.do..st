instruction processing
context: aContext sendSpecial: selector numArgs: numArgs do: aBlock
	<capability: #sendSpecial:numArgs:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext sendSpecial: selector numArgs: numArgs do: aBlock]
		ifNil: [aBlock value: selector value: numArgs]