context classes
contextClassForSimulators: simulatorArray

	| requiredCapabilities |
	requiredCapabilities := (simulatorArray gather: [:simulator | simulator requiredCapabilities
		ifNil: [^ self fullContextClass]]) as: Set.
	
	^ self contextClassForCapabilities: requiredCapabilities