private
testSelectorsFromGroups: testGroups

	^ OrderedCollection streamContents: [:stream |
		testGroups keysAndValuesDo: [:key :selectors |
			| testClass |
			testClass := key isSymbol
				ifTrue: [Smalltalk classNamed: key]
				ifFalse: [key].
			
			(true
				caseOf: {
					[selectors isSymbol] -> [
						(testClass perform: selectors) tests
							collect: #selector].
					[selectors size >= 2 and: [selectors first = #-]] -> [
						(testClass suite tests collect: #selector as: OrderedCollection)
							removeAll: selectors allButFirst withoutDuplicates;
							yourself] }
				otherwise: [selectors])
					collect: [:selector | self testSelectorForClass: testClass selector: selector]
					thenDo: [:pair | stream nextPut: pair]]]