evaluating
basicEvaluate: aBlock
	"Evaluate aBlock in a the receiver, isolating it from the rest of the image, and answer the result as it is seen from the global perspective.
	PRIVATE! Does not care about any exceptions that are signaled during the simulation, causing them to be handled still inside the sandbox, even if an exception handler has been defined outside of the sandbox stack. Depending on the configuration of the sandbox and your image, this can mean that even the eventual pop-up of the debugger will be simulated and thus invisible to you! Usually, it is a better idea to use the public #evaluate: protocol instead.
	
	Example:
		Sandbox evaluate: [World extent: 0 @ 0; bounds].
	"

	^ (SandboxContext newFrom: thisContext)
		sandbox: self;
		runSimulated: aBlock contextAtEachStep: []