accessing
setSendingPredicate: aBlock
 
	self predicate: aBlock.
	self searchMode: #sendingPredicate.