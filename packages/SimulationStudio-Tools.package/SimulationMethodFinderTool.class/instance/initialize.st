initialize-release
initialize

	super initialize.
	
	windowLabel := self class appName.
	finder := self finderClass new.
	externalBindings := Dictionary new.
	
	self initializeDefaults.