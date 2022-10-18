private
resetOutput

	self stopSearching.
	
	finder
		expectedAnswer: nil;
		predicate: nil.
	
	bindings := externalBindings copy.
	(self searchMode = #sendingPredicate ifTrue: [bindings]) ifNotNil: [:newBindings |
		bindings addAll: newBindings].