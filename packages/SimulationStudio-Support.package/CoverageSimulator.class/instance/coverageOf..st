accessing
coverageOf: aCompiledCode

	^ (self coveredPCsIn: aCompiledCode) size
		/ (self allPCsIn: aCompiledCode) size