instruction processing
context: aContext pushReceiverVariable: offset do: aBlock

	^ aContext push: (self
		context: aContext
		simulatedObject: aContext receiver
		instVarAt: offset + 1)