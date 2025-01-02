toolbuilder
buildMessageList: builder

	^ builder pluggableMultiColumnListSpec new
		model: self;
		list: #messageColumns;
		icon: #messageIconAtRow:atColumn:;
		helpItem: #messageHelpAtRow:;
		menu: #messageMenu:shifted:;
		keyPress: #messageKey:from:;
		getIndex: #selectedMessageIndex;
		setIndex: #selectedMessageIndex:;
		doubleClick: #openSelectedMessage;
		columnResizings: #(shrinkWrap spaceFill);
		yourself