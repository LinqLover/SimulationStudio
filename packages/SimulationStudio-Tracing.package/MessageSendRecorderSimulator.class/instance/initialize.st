initialize-release
initialize

	super initialize.
	
	recorder ifNil: [recorder := self newRecorder].
	recordBlocks := WeakIdentityKeyDictionary new.