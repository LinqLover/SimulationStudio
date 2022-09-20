accessing
selectedMessageIndex

	^ self messages indexOf: (self selectedProtocolMessage ifNil: [^ 0])