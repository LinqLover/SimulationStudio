controlling
context: aContext tryNamedPrimitiveIn: aCompiledMethod for: receiver withArgs: arguments do: aBlock

	self incrementPrimitiveCountFor: (aCompiledMethod literalAt: 1).
	
	^ super context: aContext tryNamedPrimitiveIn: aCompiledMethod for: receiver withArgs: arguments do: aBlock