initialize-release
initialize

	super initialize.
	
	objects := WeakIdentityKeyDictionary new.
	hashes := WeakIdentityKeyDictionary new.
	stepCount := 0.