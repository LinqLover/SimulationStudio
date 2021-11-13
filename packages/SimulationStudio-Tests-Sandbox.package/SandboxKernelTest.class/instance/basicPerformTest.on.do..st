private
basicPerformTest: aTestCase on: exceptionHandler do: exceptionBlock

	^ self sandboxClass
		evaluate: [aTestCase runCaseWithoutTimeout]
		on: exceptionHandler
		do: exceptionBlock