controlling
context: aContext elements: anArray exchangeIdentityWith: anotherArray

	anArray do: [:object |
		(self readableObjectFor: object) isReadOnlyObject
			ifTrue: [^ self context: aContext primitiveFailTokenFor: #'no modification']].
	anotherArray do: [:object |
		(self readableObjectFor: object) isReadOnlyObject
			ifTrue: [^ self context: aContext primitiveFailTokenFor: #'no modification']].
	
	^ aContext push: (self elements: anArray exchangeIdentityWith: anotherArray)