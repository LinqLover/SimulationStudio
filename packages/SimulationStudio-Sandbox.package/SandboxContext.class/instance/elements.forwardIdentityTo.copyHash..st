private - object access
elements: anArray forwardIdentityTo: otherArray copyHash: copyHash

	anArray do: [:object |
		(sandbox readableObjectFor: object) isReadOnlyObject
			ifTrue: [^ self class primitiveFailTokenFor: #'no modification']].
	
	self push: (sandbox elements: anArray forwardIdentityTo: otherArray copyHash: copyHash).