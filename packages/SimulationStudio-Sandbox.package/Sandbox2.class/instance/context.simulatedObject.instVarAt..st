private - object access
context: aContext simulatedObject: anObject instVarAt: index

	^ aContext
		object: (self readableObjectFor: anObject)
		instVarAt: index