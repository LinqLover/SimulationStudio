toolbuilder
buildClassList: builder

	^ builder pluggableMultiSelectionListSpec new
		model: self;
		list: #classes;
		getIndex: #classIndex;
		setIndex: #classIndex:;
		getSelectionList: #classSelectionsAt:;
		setSelectionList: #classSelectionsAt:put:;
		yourself