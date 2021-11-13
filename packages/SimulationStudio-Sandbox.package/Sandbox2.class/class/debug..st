support
debug: aBlock
	"Spawn a new debugger to evaluate aBlock in a new sandbox instance, isolating it from the rest of the image. Debugging convenience may be limited.
	
	Example:
		Sandbox2 debug: [World extent: 0 @ 0; bounds].
	"

	^ super debug: aBlock