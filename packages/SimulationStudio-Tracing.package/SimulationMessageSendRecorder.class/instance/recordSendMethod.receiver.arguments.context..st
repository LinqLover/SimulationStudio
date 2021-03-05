recording
recordSendMethod: aCompiledMethod receiver: aReceiver arguments: someArguments context: aContext

	^ self
		recordSendId: (numCallsBefores at: aCompiledMethod put: (
			numCallsBefores at: aCompiledMethod ifAbsent: [0]))
		method: aCompiledMethod
		receiver: aReceiver
		arguments: someArguments
		context: aContext