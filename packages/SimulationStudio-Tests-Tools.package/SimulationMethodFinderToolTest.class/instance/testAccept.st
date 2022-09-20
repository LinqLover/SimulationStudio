tests - ui
testAccept

	finder := (window := self classUnderTest open) model.
	
	(window findDeepSubmorphThat: [:m | m knownName = #inputsText] ifAbsent: [self fail])
		update: #editString with: '2. 3'.
	self deny: finder isSearching.
	(window findDeepSubmorphThat: [:m | m knownName = #outputText] ifAbsent: [self fail])
		update: #editString with: '5';
		accept.
	window world runStepMethods.
	
	[finder isSearching] whileTrue:
		[(finder stepTimeIn: window) milliSeconds wait.
		finder stepIn: window].
	self assert: finder messageList notEmpty.
	
	
	(window findDeepSubmorphThat: [:m | m knownName = #outputText] ifAbsent: [self fail])
		update: #editString with: '6'.
	self deny: finder isSearching.
	(window findDeepSubmorphThat: [:m | m knownName = #inputsText] ifAbsent: [self fail])
		update: #editString with: '3. 2';
		accept.
	window world runStepMethods.
	
	[finder isSearching] whileTrue:
		[(finder stepTimeIn: window) milliSeconds wait.
		finder stepIn: window].
	self assert: finder messageList notEmpty.