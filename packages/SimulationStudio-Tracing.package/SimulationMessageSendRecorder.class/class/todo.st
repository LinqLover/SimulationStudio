 documentation
todo

	self flag: #todo.
	'CURRENT STATE:
	- #record: works for basic examples.
	- The following does NOT work:
		SimulationMessageSendRecorder browseRecord: [
			SimulationMessageSendRecorder record: [6 / 7]].
	- many stack manipulation examples such as [SimulationContextTest new testInsertEnsure] still failing - however, this appears to be a general limitation of the MessageSendRecorder approach. See failing SimulationMsrKernelTest tests.
	- still some overhead recorded around the send of interest'