execution tests
shouldExecuteSideEffect: aBlock

	| sideEffect |
	sideEffect := false.
	aBlock value: [sideEffect := true].
	
	self assert: true equals: sideEffect.