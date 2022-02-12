controlling
context: aContext failPrimitiveWith: maybePrimFailToken do: aBlock
	<capability: #failPrimitiveWith:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext failPrimitiveWith: maybePrimFailToken do: aBlock]
		ifNil: [aBlock value: maybePrimFailToken]