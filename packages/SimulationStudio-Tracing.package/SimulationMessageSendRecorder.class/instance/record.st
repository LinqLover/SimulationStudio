recording
record

	isFirstRecording := self topRecord children isEmpty.
	
	Project current uiManager informUser: 'Recording message sends ...' during: [
		[^ self sendMessage]
			ensure: [
				self reset.
				self collectArgumentNames.
				self fixDuration]].
	
	^ nil