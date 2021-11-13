controlling
context: aContext elements: anArray forwardIdentityTo: otherArray copyHash: copyHash

	anArray do: [:object |
		(self readableObjectFor: object) isReadOnlyObject
			ifTrue: [^ self context: aContext primitiveFailTokenFor: #'no modification']].
	
	^ aContext push: (self elements: anArray forwardIdentityTo: otherArray copyHash: copyHash)