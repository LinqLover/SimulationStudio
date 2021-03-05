evaluating
basicEvaluate: aBlock

	^ (SandboxContext newFrom: thisContext)
		sandbox: self;
		runSimulated: aBlock contextAtEachStep: []