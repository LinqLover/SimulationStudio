tests - finding
testMethodFinder: specs take: limitOrNil

	finder := (window := self classUnderTest open) model.
	
	specs groupsDo: [:input :searchMode :output :pinReceiver :pinArguments :outerSuperclassName :compositeSearch :expectedResults :unexpectedResults |
		| results |
		finder
			searchMode: searchMode;
			outputText: output;
			hasPinnedReceiver: pinReceiver;
			hasPinnedArguments: pinArguments;
			outerSuperclass: (outerSuperclassName ifNotNil: [self environment classNamed: outerSuperclassName]);
			isCompositeSearch: compositeSearch;
			inputsText: input.
		
		(limitOrNil ifNil: [[finder isSearching]] ifNotNil: [[finder messageList size < limitOrNil]])
			whileTrue:
				[(finder stepTimeIn: window) milliSeconds wait.
				finder stepIn: window].
		
		results := OrderedCollection newFrom: finder messageList.
		
		expectedResults pairsDo: [:mref :string |
			| result |
			result := results detect: [:ea | string match: ea stringVersion] ifNone: [self fail].
			result ifNotNil:
				[results remove: result.
				MessageSet parse: mref toClassAndSelector: [:class :selector |
					self
						assert: class equals: result actualClass;
						assert: selector equals: result selector]]].
		unexpectedResults do: [:string |
			| result |
			result := results detect: [:ea | string match: ea stringVersion] ifNone: [].
			self assert: result isNil.
			result ifNotNil: [results remove: result]]].