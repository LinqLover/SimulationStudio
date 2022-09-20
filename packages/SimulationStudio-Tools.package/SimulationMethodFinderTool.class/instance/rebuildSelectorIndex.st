actions
rebuildSelectorIndex

	Cursor wait showWhile:
		[finder class initializeSelectorPopularities].
	
	(Project uiManager
		chooseOptionFromLabeledValues:
			(OrderedDictionary new
				at: 'OK' put: [];
				at: 'Inspect' put: [finder class browseSelectorPopularities];
				yourself)
		title: 'Selector index was rebuilt!')
			value.