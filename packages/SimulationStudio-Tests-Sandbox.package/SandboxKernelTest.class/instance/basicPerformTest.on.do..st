private
basicPerformTest: aTestCase on: exceptionHandler do: exceptionBlock

	^ Sandbox
		evaluate: [aTestCase runCaseWithoutTimeout]
		on: exceptionHandler
		do: exceptionBlock