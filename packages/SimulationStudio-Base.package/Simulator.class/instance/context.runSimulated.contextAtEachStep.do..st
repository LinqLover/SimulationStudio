controlling
context: aContext runSimulated: aBlock contextAtEachStep: anotherBlock do: simulateBlock
	<capability: #runSimulated:contextAtEachStep:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext runSimulated: aBlock contextAtEachStep: anotherBlock do: simulateBlock]
		ifNil: [simulateBlock value: aBlock value: anotherBlock]