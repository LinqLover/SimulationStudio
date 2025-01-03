initialize-release
addPragmaticMultiMethodsTo: pragmaticMethods

	(Pragma allNamed: #pragmaticClass:selectors: from: self class to: thisContext methodClass)
		do: [:pragma |
			| className|
			className := pragma argumentAt: 1.
			(Smalltalk classNamed: className)
				ifNil: [self warn: ('pragmatic method class not found: {1}' format: {className})]
				ifNotNil: [:class |
					| selectors |
					selectors := pragma argumentAt: 2.
					selectors do: [:selector |
						class >> selector
							ifNil: [self warn: ('pragmatic method not found: {1}>>{2}' format: {class. selector})]
							ifNotNil: [:method |
								pragmaticMethods
									at: method ifPresent: [:old |
										self warn: ('pragmatic method overridden: {1}' format: {method})];
									at: method put: {pragma selector}]]]].