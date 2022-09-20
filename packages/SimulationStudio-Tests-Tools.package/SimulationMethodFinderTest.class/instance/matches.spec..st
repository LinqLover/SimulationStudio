matching
matches: expression spec: spec

	| expectedMethodReference expectedReceiverAndArguments receiverAndArguments |
	expectedMethodReference := spec first methodReference.
	expectedMethodReference = expression methodReference ifFalse: [^ false].
	
	expectedReceiverAndArguments := spec third copyWithFirst: spec second.
	receiverAndArguments := expression arguments copyWithFirst: expression receiver.
	
	expectedReceiverAndArguments size = receiverAndArguments size ifFalse: [^ false].
	expectedReceiverAndArguments with: receiverAndArguments do: [:expectedArgumentSpec :argument |
		self class assert: expectedArgumentSpec isArray.
		expectedArgumentSpec first isArray
			ifTrue: "expectedValue"
				[self class
					assert: expectedArgumentSpec first isArray;
					assert: expectedArgumentSpec first size = 1.
				expectedArgumentSpec first first = argument value ifFalse: [^ false]]
			ifFalse: "expectedSpec"
				[(self matches: argument spec: expectedArgumentSpec) ifFalse: [^ false]]].
	
	^ true