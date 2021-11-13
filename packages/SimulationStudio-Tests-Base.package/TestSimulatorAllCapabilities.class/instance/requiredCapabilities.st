context classes
requiredCapabilities

	^ (Pragma allNamed: #capability: in: self class superclass)
		collect: [:pragma | pragma argumentAt: 1]
		as: Set