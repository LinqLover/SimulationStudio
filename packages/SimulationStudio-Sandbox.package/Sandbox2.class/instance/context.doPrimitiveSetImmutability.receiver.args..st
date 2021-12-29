controlling
context: aContext doPrimitiveSetImmutability: primitiveIndex receiver: rcvr args: arguments

	| boolean result |
	boolean := arguments last.
	boolean isBoolean ifFalse: [
		^ self context: aContext primitiveFailTokenFor: #'bad argument'].
	(boolean and: [(self context: aContext canBeImmutable: (self readableObjectFor: rcvr)) not]) ifTrue: [
		^ self context: aContext primitiveFailTokenFor: #'no modification'].
	
	result := (self readableObjectFor: rcvr)
		tryPrimitive: primitiveIndex
		withArgs: arguments.
	^ (aContext isPrimFailToken: result)
		ifTrue: [result]
		ifFalse: [aContext push: result]