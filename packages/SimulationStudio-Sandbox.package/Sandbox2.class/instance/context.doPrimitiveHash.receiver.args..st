controlling
context: aContext doPrimitiveHash: primitiveIndex receiver: rcvr args: arguments

	| result |
	result := (self hashFor: rcvr)
		tryPrimitive: primitiveIndex
		withArgs: arguments.
	^ (aContext isPrimFailToken: result)
		ifTrue: [result]
		ifFalse: [aContext push: result]