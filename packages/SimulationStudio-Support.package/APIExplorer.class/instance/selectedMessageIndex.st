accessing
selectedMessageIndex

	^ self messages indexOf: (self selectedMessage ifNil: [^ 0])