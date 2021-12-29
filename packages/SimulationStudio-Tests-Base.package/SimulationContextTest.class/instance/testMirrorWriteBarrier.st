tests - mirror primitives
testMirrorWriteBarrier
	| stackpBefore stackpAfter object |
	stackpBefore := thisContext stackPtr.
	
	self assert: (thisContext simObjectIsReadOnly: nil).
	self assert: (thisContext simObjectIsReadOnly: 1).
	self assert: (thisContext simObjectIsReadOnly: #(1 2 3)).
	self deny: (thisContext simObjectIsReadOnly: #(1 2 3) copy).
	self deny: (thisContext simObjectIsReadOnly: self class).
	
	object := #(1 2 3) copy.
	self shouldnt: object isReadOnlyObject.
	self deny: (thisContext simObject: object setIsReadOnly: true).
	self assert: object isReadOnlyObject.
	self assert: (thisContext simObject: object setIsReadOnly: false).
	self deny: object isReadOnlyObject.
	self should: [1 beWritableObject] raise: Error.
	
	stackpAfter := thisContext stackPtr.
	self assert: stackpBefore = stackpAfter. "Make sure primitives pop all their arguments"