*SimulationStudio-Sandbox-private-override
allocateOrRecycleBuffer: initialSize
	"Try to recycly a buffer. If this is not possibly, create a new one."
	| buffer |
	thisContext isSandboxContext ifTrue:
		["avoid mutex, don't recycle"
		^ BalloonBuffer new: initialSize].
	CacheProtect critical:[
		buffer := BufferCache at: 1.
		BufferCache at: 1 put: nil.
	].
	^buffer ifNil:[BalloonBuffer new: initialSize]