private
stopSearching

	backgroundProcess ifNotNil: #terminate.
	backgroundProcess := nil.
	
	self changed: #labelString.
	self changed: #windowTitle.