tests
testWrap

	| foo wrapBlock clientBlock |
	wrapBlock := [:block |
		foo := 1.
		block value.
		foo := 2].
	clientBlock := [
		foo := 0.
		thisContext wrap: wrapBlock.
		self assert: 1 equals: foo.
		foo := 3.
		self assert: 3 equals: foo].
	clientBlock value.
	self assert: 2 equals: foo.