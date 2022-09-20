accessing
messageIconForSideEffectOf: aMessage

	aMessage hasRun ifFalse: [^ nil].
	aMessage hasError ifTrue: [^ ToolIcons testRed].
	^ aMessage hasSideEffects
		ifFalse: [ToolIcons testGreen]
		ifTrue: [ToolIcons testOrange]