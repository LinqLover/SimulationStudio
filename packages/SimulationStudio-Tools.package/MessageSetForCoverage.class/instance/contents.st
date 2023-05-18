contents
contents

	^ self showingCoverageSource
		ifTrue:
			[self coverageSourceContents]
		ifFalse:
			[self showingCoverageByteCodes
				ifTrue:
					[self coverageByteCodesContents]
				ifFalse:
					[super contents]]