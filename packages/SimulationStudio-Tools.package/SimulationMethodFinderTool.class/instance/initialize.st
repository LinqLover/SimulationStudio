initialize-release
initialize

	super initialize.
	
	windowLabel := self class appName.
	finder := self finderClass new.
	
	self initializeDefaults.