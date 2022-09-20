private
resetOutput

	self stopSearching.
	
	finder
		expectedAnswer: nil;
		predicate: nil.
	bindings := self searchMode = #sendingPredicate ifTrue: [bindings ifNil: [Dictionary new]].