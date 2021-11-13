tests
testIdentityHashConstant

	| point result |
	point := Point basicNew.
	result := self sandboxClass evaluate: [{
		point identityHash.
		point setX: 1 setY: 2.
		point identityHash}].
	self assert: result first = result last.