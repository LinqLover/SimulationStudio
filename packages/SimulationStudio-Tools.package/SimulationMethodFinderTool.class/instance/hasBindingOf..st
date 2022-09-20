bindings
hasBindingOf: aString 

	^ bindings notNil and:
		[bindings includesKey: aString]