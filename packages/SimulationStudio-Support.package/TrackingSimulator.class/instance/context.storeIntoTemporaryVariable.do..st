instruction processing
context: aContext storeIntoTemporaryVariable: offset do: aBlock

	^ aContext
		at: offset + 1 put:
			(self tracking: aContext top fromTempVarAt: offset + 1 in: aContext);
		yourself