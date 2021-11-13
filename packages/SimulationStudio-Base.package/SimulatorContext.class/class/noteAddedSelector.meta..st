accessing method dictionary
noteAddedSelector: selector meta: isMeta

	super noteAddedSelector: selector meta: isMeta.
	
	self flag: #todo. "Is this the right hook? There is also #noteCompilationOf:meta: ..."
	Simulator cleanUpContextClasses.
	Transcript showln: ('You should restart all simulators now to apply the changes to {1}>>{2}.' format: {self. selector}).