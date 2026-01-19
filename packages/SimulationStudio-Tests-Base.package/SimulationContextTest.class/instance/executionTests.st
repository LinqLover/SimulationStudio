execution tests
executionTests

	^ (self class allSelectorsInCategory: 'execution tests')
		copyWithout: thisContext selector