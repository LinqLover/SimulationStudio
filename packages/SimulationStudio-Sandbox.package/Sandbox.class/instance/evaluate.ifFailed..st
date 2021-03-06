evaluating
evaluate: aBlock ifFailed: failBlock
	"Evaluate aBlock in a the receiver and answer the result, isolating it from the rest of the image. If aBlock signals a failure, evaluate failBlock with that failure.
	
	Example:
		Sandbox evaluate: [1 / 0] ifFailed: [:ex | Transcript showln: ex description].
	"

	^ self
		evaluate: aBlock
		on: Error, Warning, Halt
		do: failBlock