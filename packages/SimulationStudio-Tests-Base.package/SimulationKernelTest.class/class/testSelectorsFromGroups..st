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
					[SystemVersion current isAlpha not and: [testClass isNil]] -> [
						Transcript showln: ('Skipping {1} on legacy version of Squeak' format: {key}).
						#()].
					[selectors isSymbol] -> [
						(testClass perform: selectors) tests
							collect: #selector].
					[selectors size >= 2 and: [selectors first = #-]] -> [
						(testClass suite tests collect: #selector)
							copyWithoutAll: (selectors allButFirst)] }
				otherwise: [selectors])
					collect: [:selector | testClass name -> selector]
					thenDo: [:pair | stream nextPut: pair]]]