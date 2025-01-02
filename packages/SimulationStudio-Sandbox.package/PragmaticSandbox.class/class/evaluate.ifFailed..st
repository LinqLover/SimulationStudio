evaluating
evaluate: aBlock ifFailed: failBlock
	"Evaluate aBlock in a new sandbox instance and answer the result, isolating it from the rest of the image. If aBlock signals a failure, evaluate failBlock with that failure.
	
	Example:
		PragmaticSandbox evaluate: [1 / 0] ifFailed: [:ex | Transcript showln: ex description].
	"

	^ self new
		evaluate: aBlock
		ifFailed: failBlock