tests
testSimple

	| benchmark primitiveCounts stepCount |
	benchmark := self simulatorClass record: [2 / 3].
	
	stepCount := benchmark stepCount.
	self assert: (stepCount between: 10 and: 1000).
	
	primitiveCounts := benchmark primitiveCounts.
	self assert: (primitiveCounts sum < stepCount).
	self assert: ((primitiveCounts at: 7) > 0).