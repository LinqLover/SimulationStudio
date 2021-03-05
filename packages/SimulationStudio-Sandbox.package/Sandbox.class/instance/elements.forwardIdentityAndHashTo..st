primitives
elements: anArray forwardIdentityAndHashTo: anotherArray

	^ self
		elements: anArray
		forwardIdentityTo: anotherArray
		copyHash: true