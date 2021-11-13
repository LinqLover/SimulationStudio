instruction processing
context: aContext pushLiteralVariable: value do: aBlock

	^ aContext push: (self
		context: aContext
		simulatedObject: value
		instVarAt: self valueIndex)