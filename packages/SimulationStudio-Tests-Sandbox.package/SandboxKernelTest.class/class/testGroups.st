accessing
testGroups

	^ Dictionary new
		at: #BecomeTest put: #suite;
		at: #BlockClosureTest put: #(testNew testOnce testMoreThanOnce testMoreThanOnceForEqualBlocks testRunSimulated testSetUp);
		at: self put: #(classTestChangeClassOf);
		at: #ExceptionTests put: #(- testNoTimeout);
			flag: #workaround; "Disabled #testNoTimeout because of primitive 19 raised from #newProcess. See: http://forum.world.st/Just-another-debugger-bug-primitive-19-td5109411.html"
		at: #ObjectTest put: #(testBecome testBecomeForward);
		at: #TrueTest put: #suite;
		at: #UndefinedObjectTest put: #suite;
		yourself