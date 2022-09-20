support
debug: debugBlock runUntil: contextBlock

	^ self
		basicSimulate: debugBlock
		do: [:contextClass :simulator :theBlock |
			| context process |
			context := contextClass newFrom: theBlock asContext.
			context simulator: simulator.
			process := Process forContext: context.
			process
				runUntil: contextBlock;
				debug]