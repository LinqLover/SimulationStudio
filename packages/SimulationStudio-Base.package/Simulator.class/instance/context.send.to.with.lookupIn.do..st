controlling
context: aContext send: selector to: receiver with: arguments lookupIn: lookupClass do: aBlock
	<capability: #send:to:with:lookupIn:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext send: selector to: receiver with: arguments lookupIn: lookupClass do: aBlock]
		ifNil: [aBlock value: selector value: receiver value: arguments value: lookupClass]