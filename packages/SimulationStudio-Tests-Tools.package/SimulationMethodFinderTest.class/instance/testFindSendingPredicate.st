tests
testFindSendingPredicate
	<timeout: 10 "seconds">

	| receiver argument sendingPredicate stream |
	sendingPredicate := [:messageSend |
		(Array streamContents: [:s |
			stream := s.
			messageSend value])
				= #((1 2) (3 4))].
	receiver := #(1 2 3 4).
	argument := [:a :b | stream nextPut: {a. b}].
	self
		testMethodFinder: [:finder |
			finder
				receiver: receiver arguments: {argument};
				setSendingPredicate: sendingPredicate;
				outerSuperclass: Object]
		shouldFind:
			{{SequenceableCollection >> #pairsDo:. {{receiver}}. {{{argument}}}}.
			{SequenceableCollection >> #groupsDo:. {{receiver}}. {{{argument}}}}}.