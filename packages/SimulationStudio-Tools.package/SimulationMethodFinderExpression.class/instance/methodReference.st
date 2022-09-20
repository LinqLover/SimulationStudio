accessing
methodReference

	self receiver ifNil: [^ nil].
	^ self compiledMethod methodReference
		stringVersion: self printString;
		yourself