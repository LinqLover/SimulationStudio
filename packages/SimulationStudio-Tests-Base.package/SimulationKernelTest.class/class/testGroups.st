accessing
testGroups

	^ Dictionary new
		at: #BecomeTest put: #suite;
		at: #BlockClosureTest put: #(testNew testOnce testMoreThanOnce testMoreThanOnceForEqualBlocks testRunSimulated testSetUp);
		at: #ContextTest put: {#-.
			#testRunUntilErrorOrReturnFromError. #testRunUntilErrorOrReturnFromNoError. "Context>>runUntilErrorOrReturnFrom: does not turn off simulation again"};
		at: self put: super testSelectors;
		at: #ExceptionTests put: #suite;
		at: #ObjectTest put: {#testBecome
			"#testBecomeForward" flag: #upstreamBug. "See: http://forum.world.st/testBecomeForward-fails-when-simulated-in-a-rush-td5127737.html"};
		at: #TrueTest put: #suite;
		at: #UndefinedObjectTest put: #suite;
		yourself