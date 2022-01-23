accessing
allPCsIn: aCompiledCode

	^ Array streamContents: [:s |
		aCompiledCode symbolicLinesDo: [:pc :line |
			(pc = 1
				or: [line includesSubstring: 'callPrimitive:'])
					ifFalse: [s nextPut: pc]]]