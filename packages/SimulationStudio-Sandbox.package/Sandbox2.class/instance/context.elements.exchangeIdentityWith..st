controlling
context: aContext elements: anArray exchangeIdentityWith: anotherArray

	(aContext objectClass: anArray) == Array ifFalse: [
		^ self context: aContext primitiveFailTokenFor: #'bad argument'].
	(aContext objectClass: anotherArray) == Array ifFalse: [
		^ self context: aContext primitiveFailTokenFor: #'bad argument'].
	(aContext objectSize: anArray) = (aContext objectSize: anotherArray) ifFalse: [
		^ self context: aContext primitiveFailTokenFor: #'bad argument'].
	
	anArray do: [:object |
		(aContext simObjectIsReadOnly: (self readableObjectFor: object))
			ifTrue: [^ self context: aContext primitiveFailTokenFor: #'no modification']].
	anotherArray do: [:object |
		(aContext simObjectIsReadOnly: (self readableObjectFor: object))
			ifTrue: [^ self context: aContext primitiveFailTokenFor: #'no modification']].
	
	^ aContext push: (self elements: anArray exchangeIdentityWith: anotherArray)