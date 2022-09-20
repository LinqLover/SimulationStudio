accessing
selectedSelector

	^ self selectedProtocolMessage ifNotNil: [:message | message selector]