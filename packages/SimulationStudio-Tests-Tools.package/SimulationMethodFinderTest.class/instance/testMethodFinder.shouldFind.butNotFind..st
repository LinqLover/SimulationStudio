tests
testMethodFinder: finderBlock shouldFind: expectedSpecs butNotFind: unexpectedSpecs

	^ self
		testMethodFinder: finderBlock
		limit: nil
		shouldFind: expectedSpecs
		butNotFind: unexpectedSpecs