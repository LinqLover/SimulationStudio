support
debug: aBlock
	"Spawn a new debugger to evaluate aBlock in the receiver, isolating it from the rest of the image. Debugging convenience may be limited.
	
	Example:
		Sandbox debug: [World extent: 0 @ 0; bounds].
	"

	^ (SandboxContext newFrom: aBlock asContext)
		sandbox: self;
		debug