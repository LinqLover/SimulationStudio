accessing
testGroups

	^ Dictionary new
		at: #BecomeTest put: #suite;
		at: #BlockClosureTest put: #(testNew testOnce testMoreThanOnce testMoreThanOnceForEqualBlocks testRunSimulated testSetUp);
		at: #ContextTest put: {#-.
			#testRestart flag: #workaround. "uses Delay/control primitives which raises a Warning during simulation since Kernel-ct.1381 (inbox)"
			#testRunUntilErrorOrReturnFromError. #testRunUntilErrorOrReturnFromNoError. "Context>>runUntilErrorOrReturnFrom: does not turn off simulation again"
			#testSetUp flag: #workaround. "uses Compiler/Semaphore control primitive which raises a Warning during simulation since Kernel-ct.1381 (inbox)"};
		at: self put: super testSelectors;
		at: #ExceptionTests put: {#-.
			#testNoTimeout flag: #workaround "uses Delay/control primitives which raises a Warning during simulation since Kernel-ct.1381 (inbox)"};
		at: #MirrorPrimitiveTests put: #suite;
		at: #ObjectTest put: {#testBecome
			"#testBecomeForward" flag: #upstreamBug. "See: http://forum.world.st/testBecomeForward-fails-when-simulated-in-a-rush-td5127737.html"};
		at: #SimulationContextTest put: {#-.
			#testCustomizationLevel. "level 3 is just too slow"};
		at: #TrueTest put: #suite;
		at: #UndefinedObjectTest put: #suite;
		yourself