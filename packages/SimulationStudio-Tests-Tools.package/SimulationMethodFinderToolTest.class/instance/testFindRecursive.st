tests - finding
testFindRecursive
	<timeout: 15 "seconds">
	<resumable>

	^ self
		testMethodFinder:
			#('1. 10. 100' value '111' true true Integer true ('SmallInteger +' '((10) + (100)) + (1)') ())
		take: 1