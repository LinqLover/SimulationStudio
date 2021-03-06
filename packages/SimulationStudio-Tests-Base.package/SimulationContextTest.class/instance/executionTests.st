execution tests
executionTests

	^ (self class allMethodsInCategory: 'execution tests')
		copyWithout: thisContext selector