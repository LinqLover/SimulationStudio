tests
testRecursiveSandbox

	self assert: 6 * 7 equals: (
		Sandbox
			evaluate: [6 * 7]
			ifFailed: [^ self fail]).
	self assert: 6 * 7 equals: (
		Sandbox
			evaluate: [Sandbox evaluate: [6 * 7] ifFailed: [^ self fail]]
			ifFailed: [^ self fail]).