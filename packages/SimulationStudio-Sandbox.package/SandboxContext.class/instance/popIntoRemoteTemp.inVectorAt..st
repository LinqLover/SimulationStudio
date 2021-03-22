instruction decoding
popIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex

	self
		simulatedObject: (self at: tempVectorIndex + 1)
		basicAt: remoteTempIndex + 1
		put: self pop.