tests
testFindValueBlock
	<timeout: 10 "seconds">

	| argument receiver |
	receiver := [self error: 'plonk'].
	argument := [:x | x].
	self
		testMethodFinder: [:finder |
			finder
				receiver: receiver arguments: {argument};
				setExpectedAnswer: 'Error: plonk';
				outerSuperclass: ProtoObject]
		shouldFind:
			{{BlockClosure >> #ifError:. {{receiver}}. {{{argument}}}}}.