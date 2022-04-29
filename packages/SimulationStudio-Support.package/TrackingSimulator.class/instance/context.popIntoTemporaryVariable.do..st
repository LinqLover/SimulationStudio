instruction processing
context: aContext popIntoTemporaryVariable: offset do: aBlock

	^ aContext
		at: offset + 1 put:
			(self tracking: aContext pop fromTempVarAt: offset + 1 in: aContext);
		yourself