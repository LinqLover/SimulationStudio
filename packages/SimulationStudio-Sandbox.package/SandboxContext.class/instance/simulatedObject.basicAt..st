private - object access
simulatedObject: anObject basicAt: index

	^ self
		object: (sandbox readableObjectFor: anObject)
		basicAt: index