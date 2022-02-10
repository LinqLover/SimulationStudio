accessing
expectedFailureGroups

	| groups |
	groups := super expectedFailureGroups.
	
	groups at: #SimulationContextTest put: ((groups at: #SimulationContextTest ifAbsent: [{}]) , {
		#testExceptionHandlerAroundSimulator flag: #todo. "breaks out the sandbox!"}).
	
	groups at: #WriteBarrierTest put: ((groups at: #WriteBarrierTest ifAbsent: [{}]) , {
		#testMutateWideSymbolUsingPrivateAtPut flag: #todo. "sandbox-sensitive method lookup not yet implemented. This test uses become primitives to create guineaPig ..."}).
	
	groups at: self put: ((groups at: self ifAbsent: [{}]) , {
		#testContextRunUntilErrorOrReturnFromError flag: #todo "weird sandbox mismatches".
		#testContextRunUntilErrorOrReturnFromNoError flag: #todo "weird sandbox mismatches"}).
	
	^ groups