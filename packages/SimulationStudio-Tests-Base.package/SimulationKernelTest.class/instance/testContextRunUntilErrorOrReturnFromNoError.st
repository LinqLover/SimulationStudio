tests - ContextTest
testContextRunUntilErrorOrReturnFromNoError
	"Run entire process in simulation because #runUntilErrorOrReturnFrom: does not turn off simulation again"

	| context process result sender |
	process := [6 * 7] newProcess.
	process suspendedContext: (thisContext customize: process suspendedContext).
	process runUntil: [:ctxt | ctxt receiver == self].
	context := process suspendedContext.
	sender := context sender.
	
	result := context runUntilErrorOrReturnFrom: context.
	context := result first.
	
	self assert: sender equals: context.
	self assert: nil equals: result second.
	self assert: 42 equals: context top.