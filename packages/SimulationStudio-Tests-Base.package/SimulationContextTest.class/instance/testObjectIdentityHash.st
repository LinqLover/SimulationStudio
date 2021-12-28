tests
testObjectIdentityHash

	{nil. self. 42. $x. 1.23. self class. self class class} do: [:ea |
		self assert: ea identityHash equals: (thisContext simObjectIdentityHash: ea)].
	
	{Object. ProtoObject. Behavior} do: [:behavior |
		self assert: (thisContext simObjectIdentityHash: behavior) = behavior identityHash.
		self assert: behavior equals: (thisContext objectClass: behavior basicNew)].