support
debug: aBlock

	^ self
		basicSimulate: aBlock
		do: [:contextClass :simulator :theBlock |
			(contextClass newFrom: theBlock asContext)
				simulator: simulator;
				debug]