accessing
coveredPCsIn: aCompiledCode

	^ pcsPerMethod at: aCompiledCode ifAbsent: [^ #()]