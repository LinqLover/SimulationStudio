accessing
testGroups

	^ Dictionary new
		at: #ArrayTest put: #suite;
		at: #BecomeTest put: #suite;
		at: #BlockClosureTest put: #(testNew testOnce testMoreThanOnce testMoreThanOnceForEqualBlocks testRunSimulated testSetUp);
		at: #ByteArrayTest put: {#-.
			#testPlatformIndependentIntegerAccessorsAtBitBorders. #testPlatformIndependentIntegerAccessorsWithRandomValues "large"};
		at: #ContextTest put: {#-.
			#testMessageNotUnderstood. "too expensive"
			#testPrimitive83. "currently expected failure and (thus?) very expensive"
			#testPrimitive84. "currently expected failure and (thus?) very expensive"
			#testPrimitive100. "too expensive"
			#testPrimitive218. "too expensive and does not add value after testPrimitive117"
			#testRestart flag: #workaround. "uses Delay/control primitives which raises a Warning during simulation since Kernel-ct.1381 (inbox)"
			#testRunUntilErrorOrReturnFromError. #testRunUntilErrorOrReturnFromNoError. "Context>>runUntilErrorOrReturnFrom: does not turn off simulation again"
			#testSetUp flag: #workaround. "uses Compiler/Semaphore control primitive which raises a Warning during simulation since Kernel-ct.1381 (inbox)"
			#testSimulationSideEffectWarningGuardResume. "raises warning"};
		at: #DoubleByteArrayTest put: {#-.
			#testAllPossibleValues "large"};
		at: #DoubleWordArrayTest put: #suite;
		at: #ExceptionTests put: {#-.
			#testNoTimeout flag: #workaround "uses Delay/control primitives which raises a Warning during simulation since Kernel-ct.1381 (inbox)"};
		at: #FloatArrayTest put: #suite;
		at: #Float64ArrayTest put: #suite;
		at: #FloatTest put: {#-.
			#testCompiledConstants. #testFloatRounded. #testFloatTruncated. #testMaxExactInteger. "large" #testSinCosConsistency. "slow"};
		at: #IntegerArrayTest put: #suite;
		at: #MirrorPrimitiveTests put: #suite;
		at: #ObjectTest put: {#testBecome
			"#testBecomeForward" flag: #upstreamBug. "See: http://forum.world.st/testBecomeForward-fails-when-simulated-in-a-rush-td5127737.html"};
		at: #SimulationContextTest put: {#-.
			#testCustomizationLevel. "level 3 is just too slow"};
		at: #TrueTest put: #suite;
		at: #UndefinedObjectTest put: #suite;
		at: #WriteBarrierTest put: #suite;
		at: #WordArrayTest put: #suite;
		at: self put: super allTestSelectors;
		yourself