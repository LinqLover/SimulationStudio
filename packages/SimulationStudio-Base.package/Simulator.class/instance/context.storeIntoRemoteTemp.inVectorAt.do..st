instruction processing
context: aContext storeIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex do: aBlock
	<capability: #storeIntoRemoteTemp:inVectorAt:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext storeIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex do: aBlock]
		ifNil: [aBlock value: remoteTempIndex value: tempVectorIndex]