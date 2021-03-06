instance creation
fromSimulationContext: aContext

	self flag: #todo. "Double dispatch if aCustomContext class ~= self. Update: Is this still relevant?"
	^ (super fromSimulationContext: aContext)
		initializeFrom: aContext;
		yourself