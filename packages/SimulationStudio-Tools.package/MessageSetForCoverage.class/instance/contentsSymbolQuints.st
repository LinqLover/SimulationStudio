controls
contentsSymbolQuints

	^ #((coverageSource toggleCoverageSource showingCoverageSourceString 'coverage' 'the source code coverage')
	(coverageByteCodes toggleCoverageByteCodes showingCoverageByteCodesString 'byteCodes' 'the byteCodes coverage')
	-)
		, (super contentsSymbolQuints reject: [:quint | quint first = #byteCodes])