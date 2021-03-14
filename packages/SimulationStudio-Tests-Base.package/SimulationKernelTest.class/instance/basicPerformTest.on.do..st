private
basicPerformTest: aTestCase on: exceptionHandler do: exceptionBlock

	^ self contextClass runSimulated: [
		[aTestCase runCaseWithoutTimeout]
			on: exceptionHandler
			do: exceptionBlock ]