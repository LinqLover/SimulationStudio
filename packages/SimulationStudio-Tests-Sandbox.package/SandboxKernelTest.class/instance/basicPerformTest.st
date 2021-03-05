private
basicPerformTest

	| testClass testResult |
	testClass := Smalltalk classNamed: testSelector key.
	testResult := Sandbox evaluate: [
		testClass run: testSelector value].
	self
		assert: testResult passedCount = 1
		description: ['{1} ({2})' format: {self selector. testResult asString}].