app - self-updating
selfUpdate
	"SimulatorApp selfUpdate"

	((Project uiManager confirm: 'It is recommended to install the latest {2} updates first.' title: ('Updating {1}' format: {self appName. SystemVersion current version}) trueChoice: 'Yes, install latest Trunk updates now' falseChoice: 'Skip latest Trunk updates (not recommended)')
		ifNil: [^ self])
		ifTrue: [MCMcmUpdater default doUpdate: true].
	
	^ self selfUpdateFromMetacello