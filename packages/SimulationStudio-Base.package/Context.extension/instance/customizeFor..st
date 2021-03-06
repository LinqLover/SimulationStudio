*SimulationStudio-Base-converting
customizeFor: aSimulationContext
	"Answer a version of the receiver that is converted to the class of the argument, aSimulationContext."

	self == aSimulationContext ifTrue: [^ aSimulationContext].
	^ aSimulationContext customize: self