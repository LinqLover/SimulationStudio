testing
hasModifiedObject: anObject 

	^ objects
		at: anObject
		ifPresent: [:readable | (Mirror object: anObject eqeq: readable) not]
		ifAbsent: [false]