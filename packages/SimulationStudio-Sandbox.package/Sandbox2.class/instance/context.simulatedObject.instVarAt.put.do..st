private - object access
context: aContext simulatedObject: anObject instVarAt: index put: value do: aBlock

	^ super
		context: aContext
		simulatedObject: (self writableObjectFor: anObject)
		instVarAt: index
		put: value
		do: aBlock