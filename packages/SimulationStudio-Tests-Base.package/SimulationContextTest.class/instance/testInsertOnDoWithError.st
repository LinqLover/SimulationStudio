tests
testInsertOnDoWithError

	| foo |
	[
		foo := 1.
		thisContext insertOn: Error do: [foo := 2].
		self assert: 1 equals: foo.
		self error: #foo
	] value.
	self assert: 2 equals: foo.