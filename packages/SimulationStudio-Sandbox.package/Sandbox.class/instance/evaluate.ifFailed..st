evaluating
evaluate: aBlock ifFailed: failBlock

	^ self
		evaluate: aBlock
		on: Error, Warning, Halt
		do: failBlock