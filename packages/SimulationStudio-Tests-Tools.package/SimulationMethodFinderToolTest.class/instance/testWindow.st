tests - ui
testWindow

	window := self shouldnt: [self classUnderTest open] raise: Error , Warning , Halt.