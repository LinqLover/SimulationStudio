accessing
permutationMode: aSymbol

	self assert: (self allPermutationModes includes: aSymbol).
	permutationMode := aSymbol.