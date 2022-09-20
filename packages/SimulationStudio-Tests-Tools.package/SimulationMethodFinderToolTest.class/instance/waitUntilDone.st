support
waitUntilDone

	[finder isSearching] whileTrue:
		[(finder stepTimeIn: window) milliSeconds wait.
		finder stepIn: window].