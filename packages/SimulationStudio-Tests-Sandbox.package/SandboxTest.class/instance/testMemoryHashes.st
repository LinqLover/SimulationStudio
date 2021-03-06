tests
testMemoryHashes

	| sandbox a b |
	sandbox := Sandbox new.
	a := Object new.
	b := Object new.
	a identityHash = b identityHash ifTrue: [
		^ self testMemoryHashes].
	
	sandbox evaluate: [
		a becomeForward: b].
	self deny: a identityHash equals: b identityHash.
	self assert: b identityHash equals: (sandbox evaluate: [a identityHash]).
	
	sandbox := Sandbox fromMemory: sandbox exportMemory.
	self assert: b identityHash equals: (sandbox evaluate: [a identityHash]).