support
debug: aBlock

	^ (SandboxContext newFrom: aBlock asContext)
		sandbox: self;
		debug