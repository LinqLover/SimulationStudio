support
popularityOfSelector: aSymbol

	^ (SelectorPopularities ifNil: [^ Float nan])
		at: aSymbol ifAbsent: [0]