accessing method dictionary
noteAddedSelector: selector meta: isMeta

	super noteAddedSelector: selector meta: isMeta.
	
	self flag: #todo. "Is this the right hook? There is also #noteCompilationOf:meta: ..."
	self allSubInstances ifNotEmpty: [
		Transcript showln: ('You should restart all {1} subinstances now to apply the changes to {2}.' format: {self. selector})].