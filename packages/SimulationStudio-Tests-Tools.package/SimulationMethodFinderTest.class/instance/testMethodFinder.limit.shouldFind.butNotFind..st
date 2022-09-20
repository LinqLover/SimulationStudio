tests
testMethodFinder: finderBlock limit: limitOrNil shouldFind: expectedSpecs butNotFind: unexpectedSpecs

	| runner results |
	runner := self classUnderTest new
		in: finderBlock;
		yourself.
	
	results := [:stream | runner streamMatchesOn: stream] in: [:streamBlock |
		limitOrNil
			ifNil: [OrderedCollection streamContents: streamBlock]
			ifNotNil: [(Generator on: streamBlock) take: limitOrNil]].
	
	expectedSpecs do: [:spec |
		results
			detect: [:result | self matches: result spec: spec]
			ifFound: [:expectedResult |
				results remove: expectedResult]
			ifNone: [self fail]].
	
	unexpectedSpecs do: [:spec |
		results
			detect: [:result | self matches: result spec: spec]
			ifFound: [:unexpectedResult |
				self fail.
				results remove: unexpectedResult]
			ifNone: []].