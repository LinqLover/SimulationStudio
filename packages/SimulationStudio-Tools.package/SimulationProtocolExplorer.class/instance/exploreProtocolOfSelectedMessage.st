actions
exploreProtocolOfSelectedMessage

	^ self withSelectedMessageResultDo: [:result | self class openOn: result]