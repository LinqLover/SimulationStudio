controlling
context: aContext activateMethod: aCompiledMethod withArgs: arguments receiver: receiver do: aBlock

	| context next |
	context := super context: aContext activateMethod: aCompiledMethod withArgs: arguments receiver: receiver do: aBlock.
	(self wantsToSimulate: context) ifTrue:
		[^ context].
	
	next := context.
	next isSimulationContext ifTrue:
		[next := context decustomize: next].
	next := next runUntilExceptionOrReturnFrom: next ifException: [:ctx :exception | | stack |
		stack := ctx stackUpTo: aContext.
		stack
			elementsForwardIdentityTo: (stack collect: [:sender | context customize: sender])
			copyHash: true.
		^ (context customize: ctx) privRefresh].
	
	^ next