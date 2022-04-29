accessing method dictionary
noteAddedSelector: selector meta: isMeta

	super noteAddedSelector: selector meta: isMeta.
	
	self flag: #todo. "Is this the right hook? There is also #noteCompilationOf:meta: ..."
	(Simulator respondsTo: #cleanUpContextClasses) ifTrue: [
		"don't fail while checking out the package via Squot"
		Simulator cleanUpContextClasses].
	(Simulator respondsTo: #cleanUpRequiredCapabilities) ifTrue: [
		"don't fail while checking out the package via Squot"
		Simulator cleanUpRequiredCapabilities].
	Simulator allSubInstances ifNotEmpty: [
		Transcript showln: ('You should restart all simulators now to apply the changes to {1}>>{2}.' format: {self. selector})].