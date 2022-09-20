tests
testMethodFinder: finderBlock limit: limitOrNil shouldFind: expectedSpecs

	^ self
		testMethodFinder: finderBlock
		limit: limitOrNil
		shouldFind: expectedSpecs
		butNotFind: #()