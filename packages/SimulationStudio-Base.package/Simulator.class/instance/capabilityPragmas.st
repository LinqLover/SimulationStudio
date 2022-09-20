context classes
capabilityPragmas

	^ ((Pragma allNamed: #capability: from: self class to: thisContext methodClass)
		reject: [:pragma |
			(self class lookupSelector: pragma selector) methodClass == pragma methodClass])