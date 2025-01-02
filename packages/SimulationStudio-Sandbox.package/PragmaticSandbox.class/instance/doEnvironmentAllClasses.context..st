pragmatic methods - Environment
doEnvironmentAllClasses: anEnvironment context: aContext
	<pragmaticClass: #Environment selector: #allClasses>

	self assertUnmodifiedObject: anEnvironment.
	self assertUnmodifiedObject: (anEnvironment instVarNamed: 'declarations').
	
	^ anEnvironment allClasses