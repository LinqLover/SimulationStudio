private
initializeMessageList: anArray

	super initializeMessageList: anArray.
	self autoSelectString: nil.
	
	currentCompiledMethod := (messageList at: messageListIndex) compiledMethod.
	self changed: #contents.