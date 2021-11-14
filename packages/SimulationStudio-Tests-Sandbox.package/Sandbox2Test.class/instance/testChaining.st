tests
testChaining

	| limit sandbox sideEffect |
	limit := LimitSimulator new
		stepLimit: 10;
		yourself.
	sandbox := self sandboxClass decorating: limit.
	
	sideEffect := 0.
	self
		should: [sandbox evaluate:
			[(sideEffect := 1) / 2]]
		raise: SimulatorLimitExceeded.
	
	self assert: 0 equals: sideEffect.