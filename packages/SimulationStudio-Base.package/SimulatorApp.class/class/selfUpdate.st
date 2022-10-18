app - self-updating
selfUpdate
	"TraceDebugger selfUpdate"

	((Project uiManager confirm: 'It is recommended to install the latest Trunk updates first.' title: ('Updating {1}' format: {self appName}) trueChoice: 'Yes, install latest Trunk updates now' falseChoice: 'Skip latest Trunk updates (not recommended)')
		ifNil: [^ self])
		ifTrue: [MCMcmUpdater default doUpdate: true].
	
	^ self selfUpdateFromMetacello