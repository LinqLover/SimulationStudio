instruction processing
context: aContext return: value from: sender do: aBlock
	<capability: #return:from:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext return: value from: sender do: aBlock]
		ifNil: [aBlock value: value value: sender]