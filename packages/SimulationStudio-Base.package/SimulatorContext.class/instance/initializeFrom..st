initialize-release
initializeFrom: anotherContext

	super initializeFrom: anotherContext.
	
	^ simulator initializeContext: self