controlling
context: aContext send: selector to: receiver with: arguments do: aBlock
	<capability: #send:to:with:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext send: selector to: receiver with: arguments do: aBlock]
		ifNil: [aBlock value: selector value: receiver value: arguments]