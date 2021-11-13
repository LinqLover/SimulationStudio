controlling
context: aContext elements: anArray forwardIdentityTo: anotherArray

	^ self
		context: aContext
		elements: anArray
		forwardIdentityTo: anotherArray
		copyHash: false