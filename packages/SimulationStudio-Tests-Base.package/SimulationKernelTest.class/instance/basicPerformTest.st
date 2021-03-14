private
basicPerformTest

	| testCase exception |
	testCase := (Smalltalk classNamed: testSelector key) selector: testSelector value.
	
	self
		basicPerformTest: testCase
		on: (Error, Warning, Halt), TestResult failure
		do: [:ex | exception := ex].
	
	self
		assert: testCase shouldPass
		equals: exception isNil "passed?"
		description: [exception
			ifNotNil: [exception messageText]
			ifNil: ['Unexpected pass']].