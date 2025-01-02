initialize-release
initialize

	super initialize.
	
	objects := SimPluggableWeakKeyDictionary new
		"Simulation-safe WeakIdentityKeyDictionary. We must not send any message to any simulated object here (the object could inject arbitrary code in the executor by this, or it might simply not understand the message and raise an error). Use mirror primitives for identity and hash testing."
		equalBlock: [:first :second | Mirror object: first eqeq: second];
		hashBlock: [:object | Mirror simObjectIdentityHash: object];
		yourself.
	hashes := objects copy.
	stepCount := 0.