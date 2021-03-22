tests
testInsertEnsure

	| foo ensureBlock |
	ensureBlock := [foo := 2].
	[
		foo := 1.
		thisContext insertEnsure: ensureBlock.
		self assert: 1 equals: foo
	] value.
	self assert: 2 equals: foo.