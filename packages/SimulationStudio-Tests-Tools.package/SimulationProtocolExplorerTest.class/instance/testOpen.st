tests
testOpen
	"Smoke test."

	| allButFirst object |
	object := #(1 2 3).
	explorer := (window := self classUnderTest openOn: object) model.
	
	explorer setClass: SequenceableCollection selected: true.
	
	self assert: explorer messages size > 50.
	allButFirst := explorer messages detect: [:ea | ea selector = #allButFirst].
	self assert: object allButFirst equals: allButFirst result.
	
	self shouldnt: window imageForm raise: Error , Warning , Halt.