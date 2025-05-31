controlling
context: aContext activateMethod: aCompiledMethod withArgs: arguments receiver: receiver do: aBlock

	| newContext |
	newContext := super context: aContext activateMethod: aCompiledMethod withArgs: arguments receiver: receiver do: aBlock.
	
	newContext arguments withIndexDo: [:arg :index |
		newContext at: index put:
			(self tracking: arg fromArgAt: index in: newContext)].
	"newContext receiver:
		(self trackingReceiver: newContext receiver in: newContext)."
	
	^ newContext