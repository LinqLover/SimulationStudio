instruction processing
context: aContext directedSuperSend: selector numArgs: numArgs do: aBlock
	<capability: #directedSuperSend:numArgs:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext directedSuperSend: selector numArgs: numArgs do: aBlock]
		ifNil: [aBlock value: selector value: numArgs]