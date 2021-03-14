accessing
testGroups

	^ Dictionary new
		at: #BecomeTest put: #suite;
		at: #BlockClosureTest put: #(testNew testOnce testMoreThanOnce testMoreThanOnceForEqualBlocks testRunSimulated testSetUp);
		at: #ContextTest put: #(-
			testRestart "uses forking"
			testRunUntilErrorOrReturnFromError testRunUntilErrorOrReturnFromNoError "Context>>runUntilErrorOrReturnFrom: does not turn off simulation again"
			testSetUp "uses Compiler");
		at: self put: super testSelectors;
		at: #ExceptionTests put: #(- testNoTimeout);
			flag: #workaround; "Disabled #testNoTimeout because of primitive 19 raised from #newProcess. See: http://forum.world.st/Just-another-debugger-bug-primitive-19-td5109411.html"
		at: #ObjectTest put: #(testBecome
			"testBecomeForward" "#upstreamBug See: http://forum.world.st/testBecomeForward-fails-when-simulated-in-a-rush-td5127737.html");
		at: #TrueTest put: #suite;
		at: #UndefinedObjectTest put: #suite;
		yourself