tests
testRecursiveSandbox

	self assert: 6 * 7 equals: (
		self sandboxClass
			evaluate: [6 * 7]
			ifFailed: [^ self fail]).
	self assert: 6 * 7 equals: (
		self sandboxClass
			evaluate: [self sandboxClass evaluate: [6 * 7] ifFailed: [^ self fail]]
			ifFailed: [^ self fail]).