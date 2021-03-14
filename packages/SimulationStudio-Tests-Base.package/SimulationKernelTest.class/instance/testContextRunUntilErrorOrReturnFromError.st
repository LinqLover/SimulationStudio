tests - ContextTest
testContextRunUntilErrorOrReturnFromError
	"Run entire process in simulation because #runUntilErrorOrReturnFrom: does not turn off simulation again"

	| context process result sender |
	process := [self error] newProcess.
	process suspendedContext: (thisContext customize: process suspendedContext).
	process runUntil: [:ctxt | ctxt receiver == self].
	context := process suspendedContext.
	sender := context sender.
	
	result := context runUntilErrorOrReturnFrom: context.
	context := result first.
	
	self assert: (context hasSender: sender).
	self assert: (Error handles: result second).