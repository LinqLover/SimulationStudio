tests
testInsertEnsure

	| foo bar ensureBlock |
	ensureBlock := [foo := 2].
	bar := false.
	[
		foo := 1.
		thisContext insertEnsure: ensureBlock.
		bar := true.
		self assert: 1 equals: foo
	] value.
	self assert: bar.
	self assert: 2 equals: foo.