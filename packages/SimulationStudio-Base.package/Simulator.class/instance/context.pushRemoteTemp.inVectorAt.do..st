instruction processing
context: aContext pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex do: aBlock
	<capability: #pushRemoteTemp:inVectorAt:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex do: aBlock]
		ifNil: [aBlock value: remoteTempIndex value: tempVectorIndex]