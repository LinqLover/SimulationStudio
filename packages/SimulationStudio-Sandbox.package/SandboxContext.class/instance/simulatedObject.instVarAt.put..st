private - object access
simulatedObject: anObject instVarAt: index put: value

	^ self
		object: (sandbox writableObjectFor: anObject)
		instVarAt: index
		put: value