evaluating
activateDuring: aBlock

	| result |
	self recorder
		setMessageSend: [result := super activateDuring: aBlock];
		basicRecord.
	^ result