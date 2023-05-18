what to show
showingCoverageByteCodesString

	^ (self showingCoverageByteCodes
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
			, 'byteCode'