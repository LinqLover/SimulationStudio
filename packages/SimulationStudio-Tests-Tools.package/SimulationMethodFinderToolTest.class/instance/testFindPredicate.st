tests - finding
testFindPredicate
	<timeout: 5 "seconds">
	<resumable>

	^ self testMethodFinder:
		#('10 @ 20 corner: 60 @ 40' predicate 'answer isPoint' true true Object false ('Rectangle extent' '(10@20 corner: 60@40) extent' 'Rectangle randomPoint' '(10@20 corner: 60@40) randomPoint') ())