*SimulationStudio-Support-*chronology-core
valueAndStoreTimeToRun: storeBlock

	self flag: #moveUpstream.
	^ Time storeTimeToRun: self in: storeBlock