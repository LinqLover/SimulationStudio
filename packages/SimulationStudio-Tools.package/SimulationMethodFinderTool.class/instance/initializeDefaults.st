initialize-release
initializeDefaults

	self hasPinnedReceiver: self defaultHasPinnedReceiver.
	self hasPinnedArguments: self defaultHasPinnedArguments.
	self outerSuperclass: self defaultOuterSuperclass.
	self isCompositeSearch: self defaultIsCompositeSearch.
	self searchMode: self defaultSearchMode.