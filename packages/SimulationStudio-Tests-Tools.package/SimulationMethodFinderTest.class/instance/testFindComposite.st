tests
testFindComposite
	<timeout: 5 "seconds">

	self
		testMethodFinder: [:finder |
			finder
				receiver: 1 arguments: {10. 100};
				setExpectedAnswer: 111;
				outerSuperclass: Integer;
				isCompositeSearch: true]
		limit: 1
		shouldFind:
			{{SmallInteger >> #+. {SmallInteger >> #+. {{10}}. {{{100}}}}. {{{1}}}}}.