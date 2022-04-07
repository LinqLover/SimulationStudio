accessing
messageHelpFor: aMessage

	aMessage selector isUnary ifFalse: [^ nil].
	
	aMessage hasRun ifFalse: [^ nil].
	aMessage hasError ifTrue: [^ nil].
	^ aMessage hasSideEffects
		ifFalse: ['pure function call (no side effects)']
		ifTrue: ['affects global state (has side effects)']