tests
testPatchObject

	| sandbox a b x |
	sandbox := self sandboxClass new.
	a := Object new.
	b := Object new.
	x := a.
	
	sandbox evaluate: [
		self deny: b equals: x].
	
	sandbox patchObject: a with: b.
	sandbox evaluate: [
		self assert: b equals: x].