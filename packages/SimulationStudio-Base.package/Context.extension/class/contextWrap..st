*SimulationStudio-Base-special context creation
contextWrap: executeAroundBlock
	"Create a context from the argument, executeAroundBlock. The argument is expected to receive one block as an argument and must evaluate it exactly one time."

	| ctxt chain |
	ctxt := thisContext.
	executeAroundBlock value: [
		chain := thisContext sender cut: ctxt.
		ctxt push: nil.
		ctxt jump].
	"jump above will resume here without unwinding chain"
	^ chain