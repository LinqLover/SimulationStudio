accessing
allPCsIn: aCompiledCode do: aBlock

	| covered |
	covered := self coveredPCsIn: aCompiledCode.
	^ (self allPCsIn: aCompiledCode)
		do: [:pc | aBlock value: pc value: (covered includes: pc)]