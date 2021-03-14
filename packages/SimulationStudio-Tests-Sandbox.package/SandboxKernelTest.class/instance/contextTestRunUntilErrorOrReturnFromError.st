tests
contextTestRunUntilErrorOrReturnFromError

	| context process result sender |
	process := Process forContext: (thisContext customize: [self error] asContext).
	process runUntil: [:ctxt | ctxt receiver == self].
	context := process suspendedContext.
	sender := context sender.
	
	result := context runUntilErrorOrReturnFrom: context.
	context := result first.
	
	self assert: (context hasSender: sender).
	self assert: (Error handles: result second).