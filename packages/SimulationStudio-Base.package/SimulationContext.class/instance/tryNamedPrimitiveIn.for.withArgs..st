private
tryNamedPrimitiveIn: aCompiledMethod for: rcvr withArgs: arguments

	| literal |
	literal := aCompiledMethod literalAt: 1.
	(literal first == #SimulationStudio and: [literal second == #primitiveCustomizationLevel]) ifTrue: [
		^ thisContext simCustomizationLevel + 1].
	
	^ super tryNamedPrimitiveIn: aCompiledMethod for: rcvr withArgs: arguments