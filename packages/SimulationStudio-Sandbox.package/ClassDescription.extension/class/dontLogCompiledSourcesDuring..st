*SimulationStudio-Sandbox-compiling-pseudo override
dontLogCompiledSourcesDuring: aBlock

	| previous |
	previous := self logCompiledSources.
	self logCompiledSources: false.
	^ aBlock ensure: [self logCompiledSources: previous]