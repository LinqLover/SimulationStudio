evaluating
evaluate: aBlock
	"Evaluate aBlock in a the receiver and answer the result, isolating it from the rest of the image.
	
	Example:
		Sandbox evaluate: [World extent: 0 @ 0; bounds].
	"

	^ self
		evaluate: aBlock
		ifFailed: [:ex | SandboxError new
			messageText: 'Exception from simulated code: ' , ex;
			tag: ex;
			signal]