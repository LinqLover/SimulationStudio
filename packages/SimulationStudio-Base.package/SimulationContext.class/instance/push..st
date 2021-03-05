accessing - stack patching
push: val

	stack addLast: val.
	self stackp: stackp + 1.