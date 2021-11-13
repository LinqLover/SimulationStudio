recording
newRecorder

	^ SimulationMessageSendRecorder new
		simulator: self;
		yourself