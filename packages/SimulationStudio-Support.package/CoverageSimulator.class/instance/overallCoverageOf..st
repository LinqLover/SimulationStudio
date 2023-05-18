accessing
overallCoverageOf: compiledCodes

	^ (compiledCodes collect: [:compiledCode | (self coveredPCsIn: compiledCode) size]) sum
		/ (compiledCodes collect: [:compiledCode | (self allPCsIn: compiledCode) size]) sum