support
customize: aContext

	^ self
		basicSimulate: []
		do: [:contextClass :simulator :theBlock |
			(contextClass newFrom: aContext sender)
				simulator: simulator;
				customize: aContext]