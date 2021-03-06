execution tests
shouldExecuteValue: aBlock

	| sideEffect |
	sideEffect := false.
	aBlock value: [
		[sideEffect := true] value].
	
	self assert: true equals: sideEffect.