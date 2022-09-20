testing
canContextSimulateItself: aContext do: aBlock
	<capability: #canSimulateYourself>

	^ nextSimulator
		ifNotNil: [nextSimulator canContextSimulateItself: aContext do: aBlock]
		ifNil: [aBlock value]