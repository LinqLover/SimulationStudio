recording
activateDuring: aBlock

	| result |
	timeToRun := [result := super activateDuring: aBlock] timeToRun milliSeconds.
	^ result