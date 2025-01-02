tests
testDebuggerMap

	| method debuggerMap |
	method := thisContext method.
	
	debuggerMap := self sandboxClass evaluate: [method debuggerMap].
	
	self assert: method debuggerMap method equals: debuggerMap method.
	self deny: method debuggerMap identical: debuggerMap.