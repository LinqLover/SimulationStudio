initialize-release
initializeFrom: anotherContext

	super initializeFrom: anotherContext.
	
	sandbox := anotherContext sandbox.
	sandbox addObject: self.