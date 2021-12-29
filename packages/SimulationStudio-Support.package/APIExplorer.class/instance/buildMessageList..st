toolbuilder
buildMessageList: builder

	^ builder pluggableMultiColumnListSpec new
		model: self;
		list: #messageColumns;
		getIndex: #selectedMessageIndex;
		setIndex: #selectedMessageIndex:;
		doubleClick: #inspectSelectedMessage;
		columnResizings: #(#shrinkWrap #spaceFill);
		yourself