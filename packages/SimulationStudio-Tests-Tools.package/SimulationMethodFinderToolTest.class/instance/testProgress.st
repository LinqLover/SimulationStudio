tests - ui
testProgress
	<timeout: 30 "seconds">

	| percentMatcher |
	finder := (window := self classUnderTest open) model.
	
	finder inputsText: '2. 3'.
	finder outputText: '5'.
	finder isCompositeSearch: true.
	
	percentMatcher := '(\d+)%' asRegex.
	[finder messageList size < 2] whileTrue:
		[(finder stepTimeIn: window) milliSeconds wait.
		finder stepIn: window.
	
		self assert: finder isSearching.
		self assert: (finder windowTitle includesSubstring: 'searching' caseSensitive: false).
		self
			assert: (percentMatcher search: finder windowTitle);
			assert: ((percentMatcher subexpression: 2 "percent") asNumber between: 0 and: 100)].
	
	[finder messageList size < 3] whileTrue:
		[(finder stepTimeIn: window) milliSeconds wait.
		finder stepIn: window.
	
		self assert: finder isSearching.
		self assert: (finder windowTitle includesSubstring: 'searching' caseSensitive: false).
		self
			assert: (percentMatcher search: finder windowTitle);
			assert: ((percentMatcher subexpression: 2 "percent") asNumber between: 0 and: 100)].
	
	window abandon.
	self deny: finder isSearching.