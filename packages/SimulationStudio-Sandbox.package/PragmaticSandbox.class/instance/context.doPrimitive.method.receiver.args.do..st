controlling
context: aContext doPrimitive: primitiveIndex method: aCompiledMethod receiver: receiver args: arguments do: aBlock

	primitiveIndex
		caseOf:
			{[101 "primitiveBeCursor"] -> [^ aContext push: receiver "ignore"]}
		otherwise: [].
	
	^ super context: aContext doPrimitive: primitiveIndex method: aCompiledMethod receiver: receiver args: arguments do: aBlock