recording
activateDuring: aBlock

	^ [super activateDuring: aBlock]
		valueAndStoreTimeToRun: [:duration | timeToRun := duration]