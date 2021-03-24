accessing
expectedFailureGroups

	| groups |
	groups := super expectedFailureGroups.
	
	groups at: #WriteBarrierTest put: ((groups at: #WriteBarrierTest ifAbsent: [{}]) , {
		#testMutateWideSymbolUsingPrivateAtPut flag: #todo. "sandbox-sensitive method lookup not yet implemented. This test uses become primitives to create guineaPig ..."}).
	
	^ groups