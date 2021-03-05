private - object access
simulatedObject: anObject instVarAt: index put: value

	^ super
		simulatedObject: (sandbox writableObjectFor: anObject)
		instVarAt: index
		put: value