private - object access
simulatedObject: anObject basicAt: index put: value

	^ self
		object: (sandbox writableObjectFor: anObject)
		basicAt: index
		put: value