instruction processing
context: aContext pushClosureCopyNumCopiedValues: numCopied numArgs: numArgs blockSize: blockSize do: aBlock
	<capability: #pushClosureCopyNumCopiedValues:numArgs:blockSize:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext pushClosureCopyNumCopiedValues: numCopied numArgs: numArgs blockSize: blockSize do: aBlock]
		ifNil: [aBlock value: numCopied value: numArgs value: blockSize]