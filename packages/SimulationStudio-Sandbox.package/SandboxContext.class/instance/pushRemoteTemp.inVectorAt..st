instruction decoding
pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex

	self push: (self
		simulatedObject: (self at: tempVectorIndex + 1)
		basicAt: remoteTempIndex + 1).