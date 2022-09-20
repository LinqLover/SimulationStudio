tests
testFindPredicate
	<timeout: 5 "seconds">

	| receiver predicate |
	receiver := 10 @ 20 corner: 60 @ 40.
	predicate := [:answer | answer isPoint].
	self
		testMethodFinder: [:finder |
			finder
				receiver: receiver arguments: {};
				setPredicate: predicate;
				outerSuperclass: Object]
		shouldFind:
			{{Rectangle >> #extent. {{receiver}}. {}}.
			{Rectangle >> #randomPoint. {{receiver}}. {}}}.