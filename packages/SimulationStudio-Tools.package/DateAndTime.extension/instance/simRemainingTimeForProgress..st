*SimulationStudio-Tools-MethodFinder
simRemainingTimeForProgress: progress

	| elapsed overall |
	progress = 0 ifTrue: [^ nil].
	elapsed := self class now - self.
	overall := elapsed / progress.
	^ overall - elapsed