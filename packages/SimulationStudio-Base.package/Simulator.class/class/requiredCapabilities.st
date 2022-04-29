context classes
requiredCapabilities

	^ requiredCapabilities ifNil: [requiredCapabilities :=
		((Pragma allNamed: #capability: from: self to: Simulator)
			reject: [:pragma |
				(self lookupSelector: pragma selector) methodClass == pragma methodClass])
			collect: [:pragma | pragma argumentAt: 1] as: Set]