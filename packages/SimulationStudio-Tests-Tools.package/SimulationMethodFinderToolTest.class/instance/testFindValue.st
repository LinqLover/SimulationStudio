tests - finding
testFindValue
	<timeout: 10 "seconds">
	<resumable>

	^ self testMethodFinder:
		#('2. 3' value '5' true true Object false ('SmallInteger +' '(2) + (3)' 'Integer digitAdd:' '(2) digitAdd: (3)') ('(3) + (2)' '(3) digitAdd: (2)')
		'2. 3' value '5' false false Object false ('SmallInteger +' '(2) + (3)' 'Integer digitAdd:' '(2) digitAdd: (3)' 'SmallInteger +' '(3) + (2)' 'Integer digitAdd:' '(3) digitAdd: (2)') ()
		'2. 4. 7' value '4' true true nil false ('Object filterEvent:for:' '(2) filterEvent: (4) for: (7)') ())