printing
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: (' ({1} to {2}' format: {self selector printString. self receiver}).