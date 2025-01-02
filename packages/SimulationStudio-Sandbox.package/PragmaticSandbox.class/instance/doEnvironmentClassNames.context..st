pragmatic methods - Environment
doEnvironmentClassNames: anEnvironment context: aContext
	<pragmaticClass: #Environment selector: #classNames>

	self assertUnmodifiedObject: anEnvironment.
	self assertUnmodifiedObject: (anEnvironment instVarNamed: 'declarations').
	
	^ anEnvironment classNames