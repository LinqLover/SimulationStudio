evaluating
evaluate: aBlock
	"Evaluate aBlock in a new sandbox instance and answer the result, isolating it from the rest of the image.
	
	Example:
		Sandbox2 evaluate: [World extent: 0 @ 0; bounds].
	"

	^ super evaluate: aBlock