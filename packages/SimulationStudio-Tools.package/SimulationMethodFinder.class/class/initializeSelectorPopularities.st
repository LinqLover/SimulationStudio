support
initializeSelectorPopularities

	| counts |
	counts := Dictionary new.
	self systemNavigation allSelectorsAndMethodsDo: [:behavior :selector :method |
		method allLiteralsDo: [:literal |
			literal isSymbol ifTrue:
				[counts at: literal put: (counts at: literal ifAbsent: [0]) + 1]]].
	SelectorPopularities := counts.