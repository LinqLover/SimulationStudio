instruction processing
context: aContext popIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex do: aBlock

	self
		context: aContext
		simulatedObject: (aContext at: tempVectorIndex + 1)
		basicAt: remoteTempIndex + 1
		put: aContext pop.
	^ aContext