instance creation
chooseUniqueClassName

	| i className |
	i := BiggestSubclassNumber ifNil: [1] ifNotNil: [BiggestSubclassNumber + 1].
	[className := (self name , i printString) asSymbol.
	 Smalltalk includesKey: className]
		whileTrue: [i := i + 1].
	BiggestSubclassNumber := i.
	^ className