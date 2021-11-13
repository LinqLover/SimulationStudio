controlling
context: aContext runSimulated: aBlock contextAtEachStep: anotherBlock do: simulateBlock
	"Prevent optimization with ensure variable in super by never passing a zero-arg block. Reason: The variable would be only modified within the sandbox. We must not do 'sandbox addObject: thisContext' since this would allow the code under simulation to usurp the execution."

	^ super
		context: aContext
		runSimulated: aBlock
		contextAtEachStep: [:context | anotherBlock cull: context]
		do: simulateBlock