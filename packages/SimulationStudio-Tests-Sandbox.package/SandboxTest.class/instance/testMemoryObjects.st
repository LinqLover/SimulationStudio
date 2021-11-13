tests
testMemoryObjects

	| sandbox a b x |
	sandbox := self sandboxClass new.
	a := Object new.
	b := Object new.
	x := a.
	
	sandbox evaluate: [
		x := b.
		self assert: b equals: x].
	self assert: a equals: x.
	
	sandbox := self sandboxClass fromMemory: sandbox exportMemory.
	self assert: b equals: (sandbox evaluate: [x]).