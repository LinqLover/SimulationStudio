execution tests
shouldExecuteReturn: aBlock

	| returnValue |
	returnValue := aBlock value: [{2. 6. 4. 7} sorted].
	
	self assert: {2. 4. 6. 7} equals: returnValue.