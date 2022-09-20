actions
displayExample

	| spec stream |
	self okToChange ifFalse: [^ self].
	
	spec := Sensor shiftPressed
		ifFalse: [self exampleSpecs atRandom]
		ifTrue:
			[(Project uiManager chooseFromLabeledValues:
				(self exampleSpecs collect: [:ea | ('{1}. {2}' format: ea) -> ea] as: OrderedDictionary))
					ifNil: [^ self]].
	
	self initializeDefaults.
	
	stream := spec readStream skip: 2.
	stream next ifNotNil: [:symbol | self searchMode: symbol].
	stream next ifNotNil: [:bool | self hasPinnedReceiver: bool].
	stream next ifNotNil: [:bool | self hasPinnedArguments: bool].
	stream next ifNotNil: [:className | self outerSuperclass: (self environment classNamed: className)].
	stream next ifNotNil: [:bool | self isCompositeSearch: bool].
	self assert: stream atEnd.
	self
		outputText: spec second;
		inputsText: spec first.