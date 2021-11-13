private - object access
context: aContext simulatedObject: anObject basicAt: index

	^ aContext
		object: (self readableObjectFor: anObject)
		basicAt: index