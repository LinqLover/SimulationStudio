controlling
context: aContext tryNamedPrimitiveIn: aCompiledMethod for: receiver withArgs: arguments do: aBlock
	<capability: #tryNamedPrimitiveIn:for:withArgs:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext tryNamedPrimitiveIn: aCompiledMethod for: receiver withArgs: arguments do: aBlock]
		ifNil: [aBlock value: aCompiledMethod value: receiver value: arguments]