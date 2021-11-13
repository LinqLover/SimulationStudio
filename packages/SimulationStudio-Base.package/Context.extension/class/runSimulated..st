*SimulationStudio-Base-simulation-override
runSimulated: aBlock
	"Simulate the execution of aBlock, until it ends or is curtailed. Answer the result it returns."

	"Make sure that the context is not a true subinstance of the receiver"
	^((self sender: thisContext sender receiver: thisContext receiver method: thisContext method arguments: thisContext arguments) copySameFrom: thisContext) "poor man's copying..."
		runSimulated: aBlock
		contextAtEachStep: []

	"Context runSimulated: [Pen new ifNotNil: [:pen| pen defaultNib: 5. 4 timesRepeat: [pen go: 100; turn: 90]]]"

	"Here's a fun example, reaching into the computation to squash the Display>>fillWhite that mandala: begins with..."
	"thisContext
		runSimulated: [Pen new mandala: 45]
		contextAtEachStep: [:ctxt| ctxt selector == #fillWhite ifTrue: [ctxt scanFor: [:ign| ctxt willReturn]]]"