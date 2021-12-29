accessing
selectedMessageIndex: anInteger

	self selectMessage: (anInteger = 0 ifTrue: [nil] ifFalse: [self messages at: anInteger])