tests
testInsertOnDo

	| foo bar |
	bar := false.
	[
		foo := 1.
		thisContext insertOn: Error do: [foo := 2].
		bar := true.
		self assert: 1 equals: foo
	] value.
	self assert: bar.
	self assert: 1 equals: foo.