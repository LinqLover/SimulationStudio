initialize-release
initialize

	super initialize.
	
	self nextSimulator: Sandbox2 new.
	
	self initializePragmaticMethods.