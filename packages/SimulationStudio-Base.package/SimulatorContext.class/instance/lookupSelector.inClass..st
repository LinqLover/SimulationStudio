controlling
lookupSelector: aSymbol inClass: aClass

	^ simulator context: self lookupSelector: aSymbol inClass: aClass do: [:theSymbol :theClass | super lookupSelector: aSymbol inClass: aClass]