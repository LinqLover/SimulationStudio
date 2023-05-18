accessing
coveredSourceOf: aCompiledCode

	| map source |
	source := aCompiledCode getSource asText copy.
	map := aCompiledCode debuggerMap.
	((self uncoveredPCsIn: aCompiledCode) collect: [:pc | pc -> false])
		, ((self coveredPCsIn: aCompiledCode) collect: [:pc | pc -> true]) asArray
		do: [:assoc | | pc covered range |
			pc := assoc key.
			covered := assoc value.
			range := map
				rangeForPC: pc
				in: aCompiledCode
				contextIsActiveContext: false.
			source 
				addAllAttributes:
					{TextEmphasis bold.
					TextColor color: (covered
						ifTrue: [Color green muchDarker]
						ifFalse: [Color red])}
				from: range start
				to: range stop].
	^ source