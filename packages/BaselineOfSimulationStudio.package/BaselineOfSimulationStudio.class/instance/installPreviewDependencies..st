scripts
installPreviewDependencies: dependencies

	self
		flag: #workaround; "As soon as the versions listed here get merged, this should be removed"
		flag: #duplication. "See BaselineOfTelegramBot>>#installPreviewDependencies"
	
	dependencies
		do: [:dep | dep value value]
		displayingProgress: [:dep | 'Installing preview dependencies... ({1})' format: {dep key}].