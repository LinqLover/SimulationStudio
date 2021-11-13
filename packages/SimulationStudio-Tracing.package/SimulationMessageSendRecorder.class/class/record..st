recording
record: aBlock

	^ self new
		setRecordAllObjects;
		setMessageSend: aBlock;
		record;
		topRecord