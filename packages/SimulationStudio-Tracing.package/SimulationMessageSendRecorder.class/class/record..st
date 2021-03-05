as yet unclassified
record: aBlock

	^ self new
		"setRecordAllObjects;"
		setMessageSend: aBlock;
		record;
		topRecord