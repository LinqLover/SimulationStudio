instruction decoding
pushLiteralVariable: value 

	self push: (self
		simulatedObject: value
		instVarAt: ValueIndex).