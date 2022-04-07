accessing
resultOrError

	^ self hasError
		ifFalse: [self result]
		ifTrue: [self theError]