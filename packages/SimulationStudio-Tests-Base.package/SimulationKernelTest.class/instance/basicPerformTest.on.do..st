private
basicPerformTest: aTestCase on: exceptionHandler do: exceptionBlock

	^ self runSimulated: [
		[aTestCase runCaseWithoutTimeout]
			on: exceptionHandler
			do: exceptionBlock ]