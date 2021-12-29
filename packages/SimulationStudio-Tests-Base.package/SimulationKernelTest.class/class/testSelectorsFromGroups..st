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
					| allSelectors |
						allSelectors := testClass suite tests collect: #selector as: OrderedCollection.
						selectors allButFirst withoutDuplicates do: [:selector |
							allSelectors remove: selector ifAbsent: [
								thisContext simCustomizationLevel isZero ifTrue: [
									self flag: #workaround. "Critical sections not yet supported in Sandbox execution. See: https://github.com/LinqLover/SimulationStudio/issues/19"
									Transcript showln: 'Skipping non-existent test '; show: self]]].
							allSelectors]}
				otherwise: [selectors])
					collect: [:selector | self testSelectorForClass: testClass selector: selector]
					thenDo: [:pair | stream nextPut: pair]]]