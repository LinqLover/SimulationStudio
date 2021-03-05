evaluating
evaluate: aBlock ifFailed: failBlock

	^ self new
		evaluate: aBlock
		ifFailed: failBlock