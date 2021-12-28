examples
streamSelectorsFor: receiver arguments: arguments thatAnswer: expectedResult
	"Answer a generator to stream all selectors that can be performed by the given receiver with the given arguments to return the expected result. Lightweight alternative for MethodFinder."
	"
	(Sandbox2 streamSelectorsFor: [self error: 'foo'] arguments: {[:x | x]} thatAnswer: 'Error: foo') next.
	"

	| selectors |
	selectors := receiver class allSelectors select: [:sel | sel numArgs = arguments size].
	
	^ Generator on: [:generator |
		selectors do: [:sel |
			| match sandbox |
			sandbox := self new.
			sandbox stepLimit: 100000.
			match := [sandbox
				evaluate: [
					| result |
					result := (receiver perform: sel withArguments: arguments).
					result = expectedResult]
				ifFailed: [false]]
					on: Error, Warning
					do: [false].
			match ifTrue: [generator nextPut: sel] ] ]