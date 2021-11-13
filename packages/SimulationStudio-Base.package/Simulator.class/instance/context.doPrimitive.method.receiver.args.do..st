controlling
context: aContext doPrimitive: primitiveIndex method: aCompiledMethod receiver: receiver args: arguments do: aBlock
	<capability: #doPrimitive:method:receiver:args:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext doPrimitive: primitiveIndex method: aCompiledMethod receiver: receiver args: arguments do: aBlock]
		ifNil: [aBlock value: primitiveIndex value: aCompiledMethod value: receiver value: arguments]