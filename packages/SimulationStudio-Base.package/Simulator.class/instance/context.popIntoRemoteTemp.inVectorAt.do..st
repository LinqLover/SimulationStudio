instruction processing
context: aContext popIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex do: aBlock
	<capability: #popIntoRemoteTemp:inVectorAt:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext popIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex do: aBlock]
		ifNil: [aBlock value: remoteTempIndex value: tempVectorIndex]