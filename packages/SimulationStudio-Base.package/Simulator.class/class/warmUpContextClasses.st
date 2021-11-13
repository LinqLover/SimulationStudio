context classes
warmUpContextClasses

	self withAllSubclassesDo: [:class |
		self contextClassForSimulators: {class basicNew}].