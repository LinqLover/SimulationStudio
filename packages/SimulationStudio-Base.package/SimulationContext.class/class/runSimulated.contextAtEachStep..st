simulation
runSimulated: aBlock contextAtEachStep: anotherBlock

	^ (self newFrom: thisContext)
		runSimulated: aBlock
		contextAtEachStep: anotherBlock