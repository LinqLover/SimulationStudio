tests - finding
testFindSend
	<timeout: 10 "seconds">
	<resumable>

	^ self testMethodFinder:
		#('#(1 2 3 4). [:a :b | stream nextPut: {a. b}]' sendingPredicate
	'(Array streamContents: [:s |
		stream := s.
		messageSend value]) = #((1 2) (3 4))' true true Object false ('SequenceableCollection pairsDo:' '(#(1 2 3 4)) pairsDo: ([closure] *)' 'SequenceableCollection groupsDo:' '(#(1 2 3 4)) groupsDo: ([closure] *)') ())