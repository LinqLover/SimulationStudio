tests
testDecustomize

	| custom decustomized |
	custom := SimulationContext newFrom: thisContext.
	decustomized := custom decustomize: custom.
	
	self assert: Context equals: decustomized class.
	self assert: custom sender equals: decustomized sender.
	self assert: custom closure equals: decustomized closure.