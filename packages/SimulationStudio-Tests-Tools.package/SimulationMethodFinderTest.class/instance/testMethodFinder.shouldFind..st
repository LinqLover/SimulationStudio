tests
testMethodFinder: finderBlock shouldFind: expectedSpecs

	^ self
		testMethodFinder: finderBlock
		shouldFind: expectedSpecs
		butNotFind: #()