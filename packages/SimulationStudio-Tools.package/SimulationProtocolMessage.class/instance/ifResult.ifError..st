accessing
ifResult: resultBlock ifError: errorBlock

	^ self
		ifResult: resultBlock
		ifError: errorBlock
		ifPending: [self error: 'still pending']