context classes
requiredCapabilities
	"Override this and answer nil to disable optimized capabilities."

	^ ((Pragma allNamed: #capability: from: self class to: thisContext methodClass)
		reject: [:pragma |
			(self class lookupSelector: pragma selector) == pragma method])
		collect: [:pragma | pragma argumentAt: 1] as: Set