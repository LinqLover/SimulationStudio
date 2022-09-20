private - object access
elements: anArray forwardIdentityTo: anotherArray copyHash: copyHash

	(self objectClass: anArray) == Array ifFalse: [
		^ self class primitiveFailTokenFor: #'bad argument'].
	(self objectClass: anotherArray) == Array ifFalse: [
		^ self class primitiveFailTokenFor: #'bad argument'].
	(self objectClass: copyHash) simIsBooleanClass ifFalse: [
		^ self class primitiveFailTokenFor: #'bad argument'].
	(self objectSize: anArray) = (self objectSize: anotherArray) ifFalse: [
		^ self class primitiveFailTokenFor: #'bad argument'].
	
	anArray do: [:object |
		(self simObjectIsReadOnly: (sandbox readableObjectFor: object))
			ifTrue: [^ self class primitiveFailTokenFor: #'no modification']].
	
	self push: (sandbox elements: anArray forwardIdentityTo: anotherArray copyHash: copyHash).