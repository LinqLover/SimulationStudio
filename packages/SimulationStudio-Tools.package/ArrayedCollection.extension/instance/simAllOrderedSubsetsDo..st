*SimulationStudio-Tools-MethodFinder-enumerating
simAllOrderedSubsetsDo: subsetBlock

	| subset |
	0 to: 2 ** self size - 1 do: [:i |
		subset := Array new: self size streamContents: [:stream |
			1 to: self size do: [:j |
				(i bitAt: j) = 1 ifTrue:
					[stream nextPut: (self at: j)]]].
		subsetBlock value: subset].