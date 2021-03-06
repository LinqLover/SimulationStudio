controlling
push: anObject

	currentRecord ifNotNil: [
		recorder
			record: currentRecord
			return: anObject
			receiver: currentReceiver
			arguments: currentArguments
			context: self.
		currentRecord := currentReceiver := currentArguments := nil].
	
	^ super push: anObject