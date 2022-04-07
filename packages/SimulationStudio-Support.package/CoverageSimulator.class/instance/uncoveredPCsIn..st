accessing
uncoveredPCsIn: aCompiledCode

	^ (self allPCsIn: aCompiledCode)
		copyWithoutAll: (self coveredPCsIn: aCompiledCode)