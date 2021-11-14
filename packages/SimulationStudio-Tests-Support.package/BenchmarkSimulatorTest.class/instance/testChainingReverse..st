tests
testChainingReverse: aBoolean

	| limit benchmark simulator primitiveCounts stepCount |
	limit := LimitSimulator new
		stepLimit: 10;
		yourself.
	simulator := aBoolean
		ifFalse: [benchmark := self simulatorClass decorating: limit]
		ifTrue: [
			benchmark := self simulatorClass new.
			limit nextSimulator: benchmark].
	
	self
		should: [simulator evaluate: [2 / 3]]
		raise: SimulatorLimitExceeded.
	
	stepCount := benchmark stepCount.
	self assert: limit stepLimit - aBoolean asBit equals: stepCount.
	
	primitiveCounts := benchmark primitiveCounts.
	self assert: (primitiveCounts sum < stepCount).
	self assert: ((primitiveCounts at: 7) > 0).