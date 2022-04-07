private
performCarefully: selector ifFailed: failBlock

	^ self
		doCarefully: [self object perform: selector]
		ifFailed: failBlock