read-only objects
context: aContext simulatedObject: anObject instVarAt: index put: value do: aBlock
	<capability: #simulatedObject:instVarAt:put:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext simulatedObject: anObject instVarAt: index put: value do: aBlock]
		ifNil: [aBlock value: anObject value: index value: value]