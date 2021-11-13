private
recordSendMethod: aCompiledMethod receiver: receiver arguments: arguments context: aContext

	| record |
	record := recorder
		recordSendMethod: aCompiledMethod
		receiver: receiver
		arguments: arguments
		context: aContext.
	recordBlocks at: aContext put: [:result :context |
		self "halt".
		recorder
			record: record
			return: result
			receiver: receiver
			arguments: arguments
			context: context].