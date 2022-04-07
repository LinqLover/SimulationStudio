accessing
selectedMessageIndex: anInteger

	self selectProtocolMessage: (anInteger = 0 ifTrue: [nil] ifFalse: [self messages at: anInteger])