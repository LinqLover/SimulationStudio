tests - mirror primitives
testMirrorClone

	| stackpBefore stackpAfter original copy |
	stackpBefore := thisContext stackPtr.
	
	original := #(1 2 3).
	copy := thisContext simObjectClone: original.
	self deny: copy == original.
	self assert: copy = original.
	
	stackpAfter := thisContext stackPtr.
	self assert: stackpBefore = stackpAfter. "Make sure primitives pop all their arguments"