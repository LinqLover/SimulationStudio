initialization
setMessageSend: aMessageSend

	super setMessageSend: aMessageSend.
	aMessageSend isBlock
		ifTrue: [block := aMessageSend].