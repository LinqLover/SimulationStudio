as yet unclassified
todo

	self flag: #todo.
	'CURRENT STATE:
	- #record: works for basic examples.
	- This does NOT work:
		ContextMessageSendRecorder browseRecord: [
			ContextMessageSendRecorder record: [6 / 7]]
	- too much overhead recorded around'