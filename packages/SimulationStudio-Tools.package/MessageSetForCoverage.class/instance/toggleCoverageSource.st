what to show
toggleCoverageSource

	| wasShowingCoverage |
	self okToChange ifFalse: [^ self].
	
	wasShowingCoverage := self showingCoverageSource.
	self restoreTextualCodingPane.
	wasShowingCoverage
		ifTrue: [self showDocumentation: false]
		ifFalse: [contentsSymbol := #coverageSource].
	self setContentsToForceRefetch.
	self changed: #contents.