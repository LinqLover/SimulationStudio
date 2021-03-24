private - object access
elements: anArray forwardIdentityTo: anotherArray

	^ self
		elements: anArray
		forwardIdentityTo: anotherArray
		copyHash: false