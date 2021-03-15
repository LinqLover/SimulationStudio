tests
testFindSelectors

	{
		{{1. 2. 3. 4} asOrderedCollection. #(even). #(1 3) asOrderedCollection. #(removeAllSuchThat: reject:)}.
		{[self error: self asString]. {[:x | x]}. 'Error: ' , self asString. #(ifError:)}.
	} withIndexDo: [:fixture :index |
		| selectors |
		Transcript showln: ('{1}({2}: {3}' format: {self. index. fixture}).
		selectors := Sandbox
			findSelectorsFor: fixture first
			arguments: fixture second
			thatAnswer: fixture third.
		self assert: (selectors includesAllOf: fixture fourth)].