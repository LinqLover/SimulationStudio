controlling
initializeContext: aContext
	<capability: #initializeFrom:>

	^ nextSimulator
		ifNotNil: [nextSimulator initializeContext: aContext]
		ifNil: [aContext]