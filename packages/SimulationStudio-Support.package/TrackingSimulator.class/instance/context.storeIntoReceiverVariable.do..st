instruction processing
context: aContext storeIntoReceiverVariable: offset do: aBlock

	| top result |
	top := self tracking: aContext top fromInstVarAt: offset + 1 in: aContext.
	result := aContext simulatedObject: aContext receiver instVarAt: offset + 1 put: top.
	^ (aContext object: result eqeq: top)
		ifTrue: [aContext]
		ifFalse: [result]