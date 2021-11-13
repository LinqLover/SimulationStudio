controlling
context: aContext activateMethod: aCompiledMethod withArgs: arguments receiver: receiver do: aBlock
	<capability: #activateMethod:withArgs:receiver:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext activateMethod: aCompiledMethod withArgs: arguments receiver: receiver do: aBlock]
		ifNil: [aBlock value: aCompiledMethod value: arguments value: receiver]