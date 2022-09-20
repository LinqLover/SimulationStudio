tests - ui
testSimple

	finder := (window := self classUnderTest open) model.
	
	finder inputsText: '2. 3'.
	finder outputText: '5'.
	self waitUntilDone.
	
	{SmallInteger >> #+. '(2) + (3)'.
	Integer >> #digitAdd:. '(2) digitAdd: (3)'}
		pairsDo: [:method :string | | mref |
			mref := finder messageList detect: [:ea | ea compiledMethod == method] ifNone: [self fail].
			self assert: string equals: mref stringVersion].