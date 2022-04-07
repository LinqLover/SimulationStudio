accessing
messageIconFor: aMessage atColumnNamed: column

	| icon |
	aMessage selector isUnary ifFalse: [^ ToolIcons blank].
	icon := column
		caseOf:
			{[#selector] -> [self messageIconForSideEffectOf: aMessage].
			[#result] -> [self iconForObject: aMessage resultOrError]}.
	
	^ ((icon ifNil: [^ nil]) scaledIntoFormOfSize: 12) scaleIconToDisplay