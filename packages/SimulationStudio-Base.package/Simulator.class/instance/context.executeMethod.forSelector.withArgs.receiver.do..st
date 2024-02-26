instruction processing
context: aContext executeMethod: aCompiledMethod forSelector: selector withArgs: arguments receiver: receiver do: aBlock
	<capability: #executeMethod:forSelector:withArgs:receiver:>

	^ nextSimulator
		ifNotNil: [nextSimulator context: aContext executeMethod: aCompiledMethod forSelector: selector withArgs: arguments receiver: receiver do: aBlock]
		ifNil: [aBlock value: aCompiledMethod value: selector value: arguments value: receiver]