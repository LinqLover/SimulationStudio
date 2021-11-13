primitives
elements: anArray exchangeIdentityWith: anotherArray

	anArray with: anotherArray do: [:object :otherObject |
		objects
			at: object put: otherObject;
			at: otherObject put: object].
	^ anotherArray