tests
testStepCount

	| sandbox |
	sandbox := self sandboxClass new.
	
	sandbox evaluate: [2 + 3].
	
	self assert: sandbox stepCount > 0.