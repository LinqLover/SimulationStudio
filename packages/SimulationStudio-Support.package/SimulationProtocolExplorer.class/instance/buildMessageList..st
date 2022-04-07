toolbuilder
buildMessageList: builder

	^ builder pluggableMultiColumnListSpec new
		model: self;
		list: #messageColumns;
		icon: #messageIconAtRow:atColumn:;
		menu: #messageMenu:shifted:;
		getIndex: #selectedMessageIndex;
		setIndex: #selectedMessageIndex:;
		doubleClick: #inspectSelectedMessage;
		columnResizings: #(shrinkWrap spaceFill);
		yourself