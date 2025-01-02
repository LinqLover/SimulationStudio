initialize-release
addPragmaticMethodsTo: pragmaticMethods

	(Pragma allNamed: #pragmaticClass:selector: from: self class to: thisContext methodClass)
		do: [:pragma |
			| className|
			className := pragma argumentAt: 1.
			(Smalltalk classNamed: className)
				ifNil: [self warn: ('pragmatic method class not found: {1}' format: {className})]
				ifNotNil: [:class |
					| selector |
					selector := pragma argumentAt: 2.
					class >> selector
						ifNil: [self warn: ('pragmatic method not found: {1}>>{2}' format: {class. selector})]
						ifNotNil: [:method |
							pragmaticMethods
								at: method 
									ifPresent: [self warn: ('pragmatic method overridden: {1}' format: {method})];
								at: method
									put: pragma selector]]].