accessing
hasPinnedReceiver: aBoolean

	aBoolean
		ifTrue:
			[finder permutationMode = #receiverAndArguments ifTrue:
				[finder permutationMode: #arguments]]
		ifFalse:
			[finder permutationMode: #receiverAndArguments].
	
	self changed: #hasPinnedReceiver.
	self changed: #hasPinnedArguments.