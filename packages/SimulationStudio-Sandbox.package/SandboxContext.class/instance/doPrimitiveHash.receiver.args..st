private
doPrimitiveHash: primitiveIndex receiver: rcvr args: arguments

	| result |
	result := (sandbox hashFor: rcvr)
		tryPrimitive: primitiveIndex
		withArgs: arguments.
	^ (self isPrimFailToken: result)
		ifTrue: [result]
		ifFalse: [self push: result]