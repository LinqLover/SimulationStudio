what to show
toggleCoverageByteCodes

	| wasShowingCoverage |
	self okToChange ifFalse: [^ self].
	
	wasShowingCoverage := self showingCoverageByteCodes.
	self restoreTextualCodingPane.
	wasShowingCoverage
		ifTrue: [contentsSymbol := #coverageSource]
		ifFalse: [contentsSymbol := #coverageByteCodes].
	self setContentsToForceRefetch.
	self changed: #contents.