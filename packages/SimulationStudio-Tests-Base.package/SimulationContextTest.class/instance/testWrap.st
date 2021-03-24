tests
testWrap

	| foo bar wrapBlock clientBlock |
	bar := false.
	wrapBlock := [:block |
		foo := 1.
		block value.
		foo := 2].
	clientBlock := [
		foo := 0.
		thisContext wrap: wrapBlock.
		bar := true.
		self assert: 1 equals: foo.
		foo := 3.
		self assert: 3 equals: foo].
	clientBlock value.
	self assert: bar.
	self assert: 2 equals: foo.