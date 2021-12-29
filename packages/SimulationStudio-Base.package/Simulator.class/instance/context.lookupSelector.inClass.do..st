controlling
context: aContext lookupSelector: aSymbol inClass: aClass do: aBlock
	<capability: #lookupSelector:inClass:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext lookupSelector: aSymbol inClass: aClass do: aBlock]
		ifNil: [aBlock value: aSymbol value: aClass]