printing
printOn: aStream

	self isLeaf ifTrue:
		[aStream
			nextPut: $(;
			print: self value;
			nextPut: $).
		^ self].
	
	self
		printReceiverOrArgument: self receiver
		on: aStream.
	
	aStream space.
	
	self arguments ifEmpty: [^ aStream nextPutAll: self selector].
	self arguments with: self selector keywords do: [:arg :word |
		aStream
			nextPutAll: word;
			space.
		self 
			printReceiverOrArgument: arg
			on: aStream.
		aStream space].
	aStream skip: -1.