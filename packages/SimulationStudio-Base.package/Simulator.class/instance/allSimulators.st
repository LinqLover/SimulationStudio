accessing
allSimulators

	^ self nextSimulator
		ifNil: [{self}]
		ifNotNil: [:simulator | simulator allSimulators copyWithFirst: self]