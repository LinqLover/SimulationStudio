private - object access
elements: anArray exchangeIdentityWith: anotherArray

	anArray do: [:object |
		(sandbox readableObjectFor: object) isReadOnlyObject
			ifTrue: [^ self class primitiveFailTokenFor: #'no modification']].
	anotherArray do: [:object |
		(sandbox readableObjectFor: object) isReadOnlyObject
			ifTrue: [^ self class primitiveFailTokenFor: #'no modification']].
	
	self push: (sandbox elements: anArray exchangeIdentityWith: anotherArray).