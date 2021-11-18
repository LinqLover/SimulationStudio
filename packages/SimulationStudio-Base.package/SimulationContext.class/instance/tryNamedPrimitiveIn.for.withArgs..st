private
tryNamedPrimitiveIn: aCompiledMethod for: rcvr withArgs: arguments

	| literal |
	literal := aCompiledMethod literalAt: 1.
	(literal isArray and: [literal first == #SimulationStudio] and: [literal second == #primitiveCustomizationLevel]) ifTrue: [
		self flag: #todo. "Modify primitiveListBuiltinModule (or external?) and add our new module here. What about unloading attempts?"
		^ thisContext simCustomizationLevel + 1].
	
	^ super tryNamedPrimitiveIn: aCompiledMethod for: rcvr withArgs: arguments