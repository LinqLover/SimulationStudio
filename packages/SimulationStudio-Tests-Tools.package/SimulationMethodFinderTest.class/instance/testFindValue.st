tests
testFindValue
	<timeout: 10 "seconds">

	self
		testMethodFinder: [:finder |
			finder
				receiver: 2 arguments: {3};
				setExpectedAnswer: 5;
				outerSuperclass: Object]
		shouldFind:
			{{SmallInteger >> #+. {{2}}. {{{3}}}}.
			{Integer >> #digitAdd:. {{2}}. {{{3}}}}}
		butNotFind:
			{{SmallInteger >> #+. {{3}}. {{{2}}}}.
			{Integer >> #digitAdd:. {{3}}. {{{2}}}}}.
	self
		testMethodFinder: [:finder |
			finder
				receiver: 2 arguments: {3};
				setExpectedAnswer: 5;
				outerSuperclass: Object;
				permutationMode: #receiverAndArguments]
		shouldFind:
			{{SmallInteger >> #+. {{2}}. {{{3}}}}.
			{Integer >> #digitAdd:. {{2}}. {{{3}}}}.
			{SmallInteger >> #+. {{3}}. {{{2}}}}.
			{Integer >> #digitAdd:. {{3}}. {{{2}}}}}.
	
	self
		testMethodFinder: [:finder |
			finder
				receiver: 2 arguments: {4. 7};
				setExpectedAnswer: 4;
				outerSuperclass: Object;
				permutationMode: #arguments]
		shouldFind:
			{{Magnitude >> #min:max:. {{2}}. {{{7}}. {{4}}}}.
			{Magnitude >> #clampLow:high:. {{2}}. {{{4}}. {{7}}}}}.
	self
		testMethodFinder: [:finder |
			finder
				receiver: 2 arguments: {4. 7};
				setExpectedAnswer: 4;
				outerSuperclass: nil]
		shouldFind:
			{{Object >> #filterEvent:for:. {{2}}. {{{4}}. {{7}}}}}.