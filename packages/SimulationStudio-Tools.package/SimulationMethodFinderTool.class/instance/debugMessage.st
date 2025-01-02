actions
debugMessage

	| code |
	self flag: #todo. "does not work for non-evaluable printStrings! should store objects instead in MethodReference!"
	code := (self selection ifNil: [^ self changed: #flash]) stringVersion.
	(Process
		forBlock: [Compiler evaluate: code]
		runUntil: [:context | context selector isDoIt])
			debug.