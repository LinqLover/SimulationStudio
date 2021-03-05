printing
printOn: aStream

	self selector isSymbol ifTrue: [^ super printOn: aStream].
	
	aStream
		print: self class;
		nextPut: $(;
		print: self selector;
		nextPut: $).