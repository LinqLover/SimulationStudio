initialize-release
addPragmaticClassesTo: pragmaticClasses

	(Pragma allNamed: #pragmaticClass: from: self class to: thisContext methodClass)
		do: [:pragma |
			| className|
			className := pragma argumentAt: 1.
			(Smalltalk classNamed: className)
				ifNil: [self warn: ('pragmatic class not found: {1}' format: {className})]
				ifNotNil: [:class |
					pragmaticClasses
						at: class
							ifPresent: [self warn: ('pragmatic class overridden: {1}' format: {class})];
						at: class
							put: pragma selector]].