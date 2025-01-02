tests
testClassComment

	| comment |
	comment := self sandboxClass evaluate: [Object comment].
	self assert: (comment asString includesSubstring: 'root').