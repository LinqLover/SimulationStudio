examples
findSelectorsFor: receiver arguments: arguments thatAnswer: expectedResult
	"Answer all selectors that can be performed by the given receiver with the given arguments to return the expected result. Lightweight alternative for MethodFinder."
	"
	Sandbox findSelectorsFor: {1. 2. 3. 4} arguments: {[:x | x asWords] ascending} thatAnswer: {4. 1. 3. 2}.
	Sandbox findSelectorsFor: Sandbox arguments: {[2 + 3]} thatAnswer: 5.
	(Sandbox streamSelectorsFor: [self error: 'foo'] arguments: {[:x | x]} thatAnswer: 'Error: foo') next.
	"

	^ (self
		streamSelectorsFor: receiver
		arguments: arguments
		thatAnswer: expectedResult)
			contents as: Set