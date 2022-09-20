context classes
warmUpContextClasses

	self contextClassForSimulators: {self new}.
	self subclassesDo: [:class |
		class warmUpContextClasses].