*SimulationStudio-Base-support-pseudo override
debug

	self flag: #moveUpstream.
	^ (Process forBlock: self) debug