instance creation
newInstanceFrom: oldInstance variable: variable size: instSize map: map

	self flag: #todo. "Is this still required for recompiling context instances? Otherwise, remove this override."
	^ super newInstanceFrom: oldInstance variable: variable size: instSize map: map
	
	"| new |
	new := self basicNew initializeStack.
	1 to: instSize do: 
		[:offset |  (map at: offset) > 0 ifTrue:
			[new instVarAt: offset
					put: (oldInstance instVarAt: (map at: offset))]].
	variable 
		ifTrue: [1 to: oldInstance basicSize do: 
					[:offset |
					new basicAt: offset put: (oldInstance basicAt: offset)]].
	^new"