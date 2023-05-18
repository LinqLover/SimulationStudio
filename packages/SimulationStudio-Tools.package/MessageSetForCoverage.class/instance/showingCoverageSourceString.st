what to show
showingCoverageSourceString

	^ (self showingCoverageSource
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
			, 'coverage'