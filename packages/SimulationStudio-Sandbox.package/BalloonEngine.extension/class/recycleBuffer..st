*SimulationStudio-Sandbox-private-override
recycleBuffer: balloonBuffer
	"Try to keep the buffer for later drawing operations."

	thisContext isSandboxContext ifTrue:
		[^ self].
	CacheProtect critical:[ | buffer |
		buffer := BufferCache at: 1.
		(buffer isNil or:[buffer size < balloonBuffer size] )
			ifTrue:[BufferCache at: 1 put: balloonBuffer].
	].