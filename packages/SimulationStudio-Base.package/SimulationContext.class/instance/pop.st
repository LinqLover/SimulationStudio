accessing - stack patching
pop

	| val |
	val := stack removeLast.
	self stackp: stackp - 1.
	^ val