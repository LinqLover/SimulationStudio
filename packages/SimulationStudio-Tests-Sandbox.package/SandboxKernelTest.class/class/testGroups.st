accessing
testGroups

	^ Dictionary new
		at: #BecomeTest put: #suite;
		at: #BlockClosureTest put: #(testNew testOnce testMoreThanOnce testMoreThanOnceForEqualBlocks testRunSimulated testSetUp);
		at: self put: #(classTestChangeClassOf);
		at: #ExceptionTests put: #suite;
		at: #ObjectTest put: #(testBecome testBecomeForward);
		at: #TrueTest put: #suite;
		at: #UndefinedObjectTest put: #suite;
		yourself