execution tests
shouldExecute: aBlock

	| returnValue sideEffect |
	sideEffect := false.
	returnValue := aBlock value: [
		sideEffect := true.
		{2. 6. 4. 7} sorted].
	
	self assert: true equals: sideEffect.
	self assert: {2. 4. 6. 7} equals: returnValue.