instance creation
browseRecord: aBlock

	^ self new
		record: aBlock;
		browseRecord