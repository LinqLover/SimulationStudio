context classes
requiredCapabilities
	"Override this and answer nil to disable optimized capabilities."

	^ self capabilityPragmas
		collect: [:pragma | pragma argumentAt: 1] as: Set