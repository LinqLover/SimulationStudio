printing
printReceiverOrArgument: argument on: aStream

	aStream
		nextPut: $(;
		print:
			(argument isLeaf
				ifTrue: [argument value]
				ifFalse: [argument]);
		nextPut: $).