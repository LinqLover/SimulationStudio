private
doPrimitiveSetImmutability: primitiveIndex receiver: rcvr args: arguments

	| boolean result |
	boolean := arguments first.
	boolean isBoolean ifFalse: [
		^ self class primitiveFailTokenFor: #'bad argument'].
	(boolean and: [(self canBeImmutable: (sandbox readableObjectFor: rcvr)) not]) ifTrue: [
		^ self class primitiveFailTokenFor: #'no modification'].
	
	result := (sandbox readableObjectFor: rcvr)
		tryPrimitive: primitiveIndex
		withArgs: arguments.
	^ (self isPrimFailToken: result)
		ifTrue: [result]
		ifFalse: [self push: result]