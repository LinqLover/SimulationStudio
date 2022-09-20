accessing
searchMode: aSymbol

	self assert: (self allSearchModes includes: aSymbol).
	searchMode := aSymbol.