tests
testInsertOnDo

	| foo exceptionBlock |
	exceptionBlock := [foo := 2].
	
	[
		foo := 1.
		thisContext insertOn: Error do: exceptionBlock.
		self assert: 1 equals: foo
	] value.
	self assert: 1 equals: foo.
	
	[
		foo := 1.
		thisContext insertOn: Error do: exceptionBlock.
		self assert: 1 equals: foo.
		self error: #foo
	] value.
	self assert: 2 equals: foo.