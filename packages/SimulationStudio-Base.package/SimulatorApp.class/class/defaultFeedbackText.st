app - feedback
defaultFeedbackText

	^ '<br><br><i>Reported from {1}, for version of {2} (VM: {3}) last updated at {4}.</i>' asTextFromHtml format:
		{SystemVersion current.
		self appName.
		([Smalltalk vm openSmalltalkVMBuildNumber] ifError: [nil]) ifNil: [Smalltalk platformSourceVersion].
		self latestTimeStamp}