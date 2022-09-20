controlling
context: aContext elements: anArray forwardIdentityTo: anotherArray copyHash: copyHash

	(aContext objectClass: anArray) == Array ifFalse: [
		^ self context: aContext primitiveFailTokenFor: #'bad argument'].
	(aContext objectClass: anotherArray) == Array ifFalse: [
		^ self context: aContext primitiveFailTokenFor: #'bad argument'].
	(aContext objectClass: copyHash) simIsBooleanClass ifFalse: [
		^ self context: aContext primitiveFailTokenFor: #'bad argument'].
	(aContext objectSize: anArray) = (aContext objectSize: anotherArray) ifFalse: [
		^ self context: aContext primitiveFailTokenFor: #'bad argument'].
	
	anArray do: [:object |
		(self readableObjectFor: object) isReadOnlyObject
			ifTrue: [^ self context: aContext primitiveFailTokenFor: #'no modification']].
	
	^ aContext push: (self elements: anArray forwardIdentityTo: anotherArray copyHash: copyHash)