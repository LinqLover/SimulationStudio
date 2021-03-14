accessing
testGroups

	| groups |
	groups := super testGroups.
	
	self assert: (groups at: #ContextTest) first = #-.
	groups at: #ContextTest put: ((groups at: #ContextTest) , {
		#testSetUp flag: #workaround. "uses Compiler/FilePlugin currently disabled in sandbox"}).
	
	^ groups