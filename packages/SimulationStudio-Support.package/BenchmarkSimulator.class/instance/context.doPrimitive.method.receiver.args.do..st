controlling
context: aContext doPrimitive: primitiveIndex method: aCompiledMethod receiver: receiver args: arguments do: aBlock

	primitiveCounts at: primitiveIndex put: (primitiveCounts at: primitiveIndex ifAbsent: [0]) + 1.
	
	^ super context: aContext doPrimitive: primitiveIndex method: aCompiledMethod receiver: receiver args: arguments do: aBlock