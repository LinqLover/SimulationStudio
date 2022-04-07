private
doCarefully: aBlock ifFailed: errorBlock

	^ [self sandboxClass evaluate: aBlock ifFailed: errorBlock]
		valueWithin: 1 second
		onTimeout: errorBlock