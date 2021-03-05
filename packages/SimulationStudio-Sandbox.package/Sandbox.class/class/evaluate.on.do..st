evaluating
evaluate: aBlock on: exceptionHandler do: exceptionBlock

	^ self new
		evaluate: aBlock
		on: exceptionHandler
		do: exceptionBlock