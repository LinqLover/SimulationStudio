tests
testStepLimit

	| sandbox result |
	sandbox := self sandboxClass new.
	
	sandbox stepLimit: 200.
	result := sandbox evaluate: [10 factorial].
	
	self assert: 10 factorial equals: result.
	
	sandbox stepLimit: 200 * 2.
	self
		should: [sandbox evaluate: [100 factorial]]
		raise: Error.