instruction decoding
pushReceiverVariable: offset 

	self push: (self
		simulatedObject: self receiver
		instVarAt: offset + 1).