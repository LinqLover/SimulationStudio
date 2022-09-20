*SimulationStudio-Tools-MethodFinder
simRemainingTimeForProgress: progress

	| elapsed overall |
	elapsed := self class now - self.
	overall := elapsed / progress.
	^ overall - elapsed

