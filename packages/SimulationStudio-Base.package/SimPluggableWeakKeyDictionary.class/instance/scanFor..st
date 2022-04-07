private
scanFor: anObject 
	"Scan the key array for the first slot containing either a nil (indicating an empty slot) or an element that matches anObject. Answer the index of that slot or raise an error if no slot is found. This method will be overridden in various subclasses that have different interpretations for matching elements."
	
	| index start size |
	index := start := (hashBlock
		ifNil: [ anObject hash ]
		ifNotNil: [ hashBlock value: anObject ]) \\ (size := array size) + 1.
	[ 
		| element |
		((element := array at: index) == nil or: [
			equalBlock
				ifNil: [ element key = anObject ]
				ifNotNil: [ equalBlock value: element key value: anObject ] ])
			ifTrue: [ ^index ].
		(index := index \\ size + 1) = start ] whileFalse.
	self errorNoFreeSpace