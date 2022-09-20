bindings
hasBindingThatBeginsWith: aString 
	
	bindings ifNil: [^ super hasBindingThatBeginsWith: aString].
	
	^ bindings keys anySatisfy: [:each |
		each beginsWith: aString]