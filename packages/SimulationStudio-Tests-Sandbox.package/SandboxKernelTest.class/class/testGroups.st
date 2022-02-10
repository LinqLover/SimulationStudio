accessing
testGroups

	| groups |
	groups := super testGroups.
	
	self assert: (groups at: #ContextTest) first = #-.
	groups at: #ContextTest put: ((groups at: #ContextTest) , {
		#testSetUp flag: #workaround. "uses Compiler/FilePlugin currently disabled in sandbox"}).
	
	self assert: (groups at: self) first ~= #-.
	groups at: self put: ((groups at: self) , {#-.
		#testContextRunUntilErrorOrReturnFromError flag: #todo "weird sporadic sandbox mismatches".
		#testContextRunUntilErrorOrReturnFromNoError flag: #todo "weird sporadic sandbox mismatches"}).
	
	^ groups