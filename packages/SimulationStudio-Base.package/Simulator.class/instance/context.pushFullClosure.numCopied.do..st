instruction processing
context: aContext pushFullClosure: aCompiledBlock numCopied: numCopied do: aBlock
	<capability: #pushFullClosure:numCopied:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext pushFullClosure: aCompiledBlock numCopied: numCopied do: aBlock]
		ifNil: [aBlock value: aCompiledBlock value: numCopied value]