accessing - stack patching
stackp: newStackp

	| delta |
	stackp := newStackp.
	delta := stack size - stackp.
	delta > 0 ifTrue: [
		stack removeLast: delta].
	delta < 0 ifTrue: [
		delta negated timesRepeat: [
			stack addLast: nil]].