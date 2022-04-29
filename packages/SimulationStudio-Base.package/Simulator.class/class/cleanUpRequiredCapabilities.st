context classes
cleanUpRequiredCapabilities

	requiredCapabilities := nil.
	self allSubclassesDo: [:simulatorClass |
		simulatorClass cleanUpRequiredCapabilities].