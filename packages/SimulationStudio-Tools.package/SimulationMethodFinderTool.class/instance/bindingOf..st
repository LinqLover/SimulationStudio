bindings
bindingOf: aString

	bindings ifNil: [^ super bindingOf: aString].
	
	(bindings includesKey: aString) ifFalse: [
		bindings at: aString put: nil].
	^ bindings associationAt: aString