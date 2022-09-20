accessing
searchMode: aSymbol

	finder searchMode: aSymbol.
	
	self resetOutput.
	
	self changed: #isOutputValue.
	self changed: #isOutputPredicate.
	self changed: #isOutputSendingPredicate.
	self changed: #outputPaneHelp.
	self changed: #style.