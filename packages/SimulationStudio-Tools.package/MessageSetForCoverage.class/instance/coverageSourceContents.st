contents
coverageSourceContents

	currentCompiledMethod ifNil: [^ nil].
	^ (self coverage coveredSourceOf: currentCompiledMethod)
		makeSelectorBold