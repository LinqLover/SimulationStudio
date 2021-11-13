instruction processing
context: aContext pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex do: aBlock

	^ aContext push: (self
		context: aContext
		simulatedObject: (aContext at: tempVectorIndex + 1)
		basicAt: remoteTempIndex + 1)