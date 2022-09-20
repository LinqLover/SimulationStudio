updating
stepIn: window

	super stepIn: window.
	
	self isSearching ifTrue:
		[
		backgroundProcess isTerminated ifTrue:
			[backgroundProcess := nil].
		self receiveNewResults.
		backgroundProcess ifNil:
			[resultQueue := nil].
		
		self changed: #labelString.
		self changed: #windowTitle].