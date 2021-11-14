*SimulationStudio-Base-simulation-override
runSimulated: aBlock
	"Simulate the execution of aBlock, until it ends or is curtailed. Answer the result it returns."

	| sender |
	sender := thisContext.
	"Make sure that the context is not a true subinstance of the receiver"
	^((self sender: sender receiver: sender receiver method: sender method arguments: sender arguments) copySameFrom: sender) "poor man's copying..."
		runSimulated: aBlock
		contextAtEachStep: [:ctx | "Context >> #runSimulated:contextAtEachStep: assumes that every context on the stack wil perform any side effects with global visibility. This assumption, however, does not hold true for all SimulatorContext subinstances (looking at you, Sandbox), thus we pass a one-arg block here to prevent optimization with ensure variable in #runSimulated:contextAtEachStep:. See also SandboxContext >> #runSimulated:contextAtEachStep:."]

	"Context runSimulated: [Pen new ifNotNil: [:pen| pen defaultNib: 5. 4 timesRepeat: [pen go: 100; turn: 90]]]"

	"Here's a fun example, reaching into the computation to squash the Display>>fillWhite that mandala: begins with..."
	"thisContext
		runSimulated: [Pen new mandala: 45]
		contextAtEachStep: [:ctxt| ctxt selector == #fillWhite ifTrue: [ctxt scanFor: [:ign| ctxt willReturn]]]"