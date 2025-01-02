actions
debugSelectedMessage

	| message |
	message := self selectedProtocolMessage ifNil: [^ self].
	message debug.