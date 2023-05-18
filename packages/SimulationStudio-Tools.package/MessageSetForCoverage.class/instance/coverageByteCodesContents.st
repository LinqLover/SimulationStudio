contents
coverageByteCodesContents

	currentCompiledMethod ifNil: [^ nil].
	^ self coverage coveredSymbolicOf: currentCompiledMethod