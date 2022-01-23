accessing
coveredSymbolicOf: aCompiledCode

	| covered uncovered |
	covered := self coveredPCsIn: aCompiledCode.
	uncovered := self uncoveredPCsIn: aCompiledCode.
	^ Text streamContents: [:stream |
		aCompiledCode symbolicLinesDo: [:pc :line | | color |
			color := nil.
			(covered includes: pc)
				ifTrue: [color := Color green muchDarker]
				ifFalse: [(uncovered includes: pc)
					ifTrue: [color := Color red]].
			
			stream print: pc; tab.
			stream
				withAttributes: (color
					ifNotNil: [{TextEmphasis bold. TextColor color: color}]
					ifNil: [{}])
				do: [
					stream nextPutAll: line; cr]]]