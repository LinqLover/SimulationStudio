tests
testInsertEnsureWithError

	| foo ensureBlock |
	ensureBlock := [foo := 2].
	self
		should: [
			foo := 1.
			thisContext insertEnsure: ensureBlock.
			self error: #foo]
		raise: Error.
	self assert: 2 equals: foo.