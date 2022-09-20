accessing
messageColumns

	^ {
		#selector.
		[:message | message assureResult;
			ifResult: [:result |
				[result printString]
					on: Error, Warning, Halt
					do: [:ex | '<printString error: {1}>' format: {ex}]]
			ifError: [:error | message selector isUnary
				ifTrue: ['<error: {1}>' format: {error}]
				ifFalse: ['']]
			ifPending: ['...']]
	} collect: [:columnBlock |
		self messages collect: [:message | columnBlock value: message]]