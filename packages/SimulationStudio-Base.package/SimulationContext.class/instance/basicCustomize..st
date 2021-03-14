converting
basicCustomize: aContext
	"Answer a copy of aContext that is converted to the class of the receiver."

	^ (self class newFrom: aContext)
		initializeFrom: self