system simulation
step

	self flag: #todo. "This is our last resort only - preferably, we should identify all places where new contexts are generated (e.g., during block activation) and convert them there already!"
	^ self customize: super step