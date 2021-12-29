private
doCarefully: aBlock ifFailed: errorBlock

	^ [Sandbox evaluate: aBlock ifFailed: errorBlock]
		valueWithin: 1 second
		onTimeout: errorBlock