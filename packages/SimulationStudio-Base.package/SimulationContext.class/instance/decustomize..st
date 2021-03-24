converting
decustomize: aContext
	"Answer a version of the argument, aContext, that is an ordinary Context and can be executed by the current executor."

	^ Context fromSimulationContext: aContext