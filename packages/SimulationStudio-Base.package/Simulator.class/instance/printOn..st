printing
printOn: aStream

	super printOn: aStream.
	self nextSimulator ifNotNil: [:next |
		aStream
			nextPut: $(;
			print: next;
			nextPut: $)].