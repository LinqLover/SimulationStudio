recording
record

	^ Project current uiManager informUser: 'Recording message sends ...' during: [
		self sendBasicMessage]