controlling
initializeContext: aContext

	| result |
	result := super initializeContext: aContext.
	
	self addObject: result.
	
	^ result