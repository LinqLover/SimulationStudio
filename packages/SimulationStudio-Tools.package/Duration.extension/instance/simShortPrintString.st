*SimulationStudio-Tools-MethodFinder-printing
simShortPrintString

	^ String streamContents: [:stream | self simShortPrintOn: stream]