controlling
context: aContext elements: anArray forwardIdentityAndHashTo: anotherArray

	^ self
		context: aContext
		elements: anArray
		forwardIdentityTo: anotherArray
		copyHash: true