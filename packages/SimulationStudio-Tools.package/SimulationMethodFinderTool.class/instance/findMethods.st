actions
findMethods

	self stopSearching.
	
	self inputsText isEmptyOrNil ifTrue: [^ self changed: #flash].
	self outputText isEmptyOrNil ifTrue: [^ self changed: #flash].
	
	resultQueue := SharedQueue new.
	backgroundProcess := [finder streamMatchesOn: resultQueue]
		forkAt: Processor systemBackgroundPriority.
	
	self initializeMessageList: #().
	self messageListIndex: 0.
	self changed: #messageList.
	self changed: #labelString.
	self changed: #windowTitle.