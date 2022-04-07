toolbuilder
buildClassList: builder

	^ builder pluggableMultiSelectionListSpec new
		model: self;
		list: #indentedClasses;
		icon: #classIconAt:;
		getIndex: #classIndex;
		setIndex: #classIndex:;
		getSelectionList: #classSelectionsAt:;
		setSelectionList: #classSelectionsAt:put:;
		yourself