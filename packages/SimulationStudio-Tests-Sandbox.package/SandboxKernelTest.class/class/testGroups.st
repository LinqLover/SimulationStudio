accessing
testGroups

	| groups |
	groups := super testGroups.
	
	self assert: (groups at: #ContextTest) first = #-.
	groups at: #ContextTest put: ((groups at: #ContextTest) , {
		#testRestart flag: #workaround. "uses forking/control primitives currently disabled in sandbox"
		#testSetUp flag: #workaround. "uses Compiler/FilePlugin currently disabled in sandbox"}).
	
	self assert: (groups at: #ExceptionTests) = #suite.
	groups at: #ExceptionTests put: {#-.
		#testNoTimeout flag: #workaround "uses forking/control primitives currently disabled in sandbox"}.
	
	^ groups