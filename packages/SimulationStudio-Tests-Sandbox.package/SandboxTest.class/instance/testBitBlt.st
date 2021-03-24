tests
testBitBlt

	| display originalColors |
	display := Display copy.
	originalColors := display colorsUsed.
	self deny: {Color blue} equals: originalColors description: 'Prerequisites not matched'.
	
	Sandbox evaluate: [
		display fillColor: Color blue.
		self assert: {Color blue} equals: display colorsUsed].
	
	self assert: originalColors equals: display colorsUsed.