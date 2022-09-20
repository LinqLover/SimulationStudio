accessing - toolbuilder
setSearchMode: aSymbol

	self searchMode: aSymbol.
	
	self changed: #inputRequested with: #outputText.
	(self dependentTextPaneWithSelector: #outputText)
		ifNotNil: [:m | m hasUnacceptedEdits: true].