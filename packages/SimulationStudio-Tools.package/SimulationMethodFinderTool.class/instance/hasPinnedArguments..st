accessing
hasPinnedArguments: aBoolean

	aBoolean
		ifTrue:
			[finder permutationMode: nil]
		ifFalse:
			[finder permutationMode ifNil:
				[finder permutationMode: #arguments]].
	
	self changed: #hasPinnedArguments.