tests
contextTestRunUntilErrorOrReturnFromNoError

	| context process result sender |
	process := Process forContext: (thisContext customize: [6 * 7] asContext).
	process runUntil: [:ctxt | ctxt receiver == self].
	context := process suspendedContext.
	sender := context sender.
	
	result := context runUntilErrorOrReturnFrom: context.
	context := result first.
	
	self assert: sender equals: context.
	self assert: nil equals: result second.
	self assert: 42 equals: context top.