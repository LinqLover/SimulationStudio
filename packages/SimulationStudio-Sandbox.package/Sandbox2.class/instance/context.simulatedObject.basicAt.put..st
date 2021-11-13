private - object access
context: aContext simulatedObject: anObject basicAt: index put: value

	^ aContext
		object: (self writableObjectFor: anObject)
		basicAt: index
		put: value