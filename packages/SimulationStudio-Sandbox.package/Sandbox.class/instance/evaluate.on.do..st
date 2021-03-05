evaluating
evaluate: aBlock on: exceptionHandler do: exceptionBlock

	| result exception |
	self basicEvaluate: [[result := aBlock value]
		on: exceptionHandler
		do: [:ex | exception := ex]].
	
	(self basicEvaluate: [exception]) ifNotNil: [:ex | ^ exceptionBlock cull: ex].
	
	^ self basicEvaluate: [result]