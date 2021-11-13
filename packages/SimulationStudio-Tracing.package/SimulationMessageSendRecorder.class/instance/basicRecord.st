recording
basicRecord
	"ASSUMES that we are already simulating code."

	isFirstRecording := self topRecord children isEmpty.
	
	[^ self sendMessage]
		ensure: [
			self reset.
			self collectArgumentNames.
			self fixDuration].
	
	^ nil