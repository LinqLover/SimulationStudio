primitives
elements: anArray forwardIdentityTo: anotherArray copyHash: copyHash

	anArray with: anotherArray do: [:object :otherObject |
		objects at: object put: otherObject.
		copyHash
			ifFalse: [hashes at: object put: otherObject]
			ifTrue: [hashes at: otherObject put: object]].
	
	^ anotherArray