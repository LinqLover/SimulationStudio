private - object access
simulatedObject: anObject instVarAt: index

	^ self
		object: (sandbox readableObjectFor: anObject)
		instVarAt: index