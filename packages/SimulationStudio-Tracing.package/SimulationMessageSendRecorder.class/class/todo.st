 documentation
todo

	self flag: #todo.
	'CURRENT STATE:
	- #record: works for basic examples.
	- This does NOT work:
		SimulationMessageSendRecorder browseRecord: [
			SimulationMessageSendRecorder record: [6 / 7]].
		[SimulationContextTest new testInsertEnsure] browseSimulationMessageSendRecord. "this one appears to be a general limitation of the MessageSendRecorder."
	- too much overhead recorded around
	- many stack manipulation examples such as #insertEnsure: still failing'