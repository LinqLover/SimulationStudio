evaluating
evaluate: aBlock

	^ self
		basicSimulate: aBlock
		do: [:contextClass :simulator :theBlock |
			contextClass new
				simulator: simulator;
				runSimulated: theBlock]