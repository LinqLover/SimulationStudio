instruction processing
context: aContext send: selector super: superFlag numArgs: numArgs do: aBlock
	<capability: #send:super:numArgs:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext send: selector super: superFlag numArgs: numArgs do: aBlock]
		ifNil: [aBlock value: selector value: superFlag value: numArgs]