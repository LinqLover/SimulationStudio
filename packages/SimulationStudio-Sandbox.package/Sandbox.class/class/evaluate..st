evaluating
evaluate: aBlock
	"Evaluate aBlock in a new sandbox instance, isolating it from the rest of the image.
	
	Example:
		Sandbox evaluate: [World extent: 0 @ 0; bounds].
	"

	^ self new evaluate: aBlock