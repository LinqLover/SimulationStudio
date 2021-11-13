private
basicSimulate: aBlock do: contextClassBlock
	"DO NOT override this! To wrap custom logic around the simulated code, override #basicSimulate:do:chain: instead."

	^ self
		basicSimulate: aBlock
		do: [:theBlock :simulatorArray | | contextClass |
			contextClass := self class contextClassForSimulators: simulatorArray.
			contextClassBlock value: contextClass value: simulatorArray first value: theBlock]
		chain: {self}