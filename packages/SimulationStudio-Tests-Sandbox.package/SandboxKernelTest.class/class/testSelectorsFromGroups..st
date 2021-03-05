private
testSelectorsFromGroups: testGroups

	^ OrderedCollection streamContents: [:stream |
		testGroups keysAndValuesDo: [:key :selectors |
			| testClass |
			testClass := key isSymbol
				ifTrue: [Smalltalk classNamed: key]
				ifFalse: [key].
			
			(selectors isSymbol
				ifTrue: [(testClass perform: selectors) tests collect: #selector]
				ifFalse: [selectors])
					collect: [:selector | testClass name -> selector]
					thenDo: [:pair | stream nextPut: pair]]]