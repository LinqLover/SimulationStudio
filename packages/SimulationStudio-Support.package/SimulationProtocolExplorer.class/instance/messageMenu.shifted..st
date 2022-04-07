toolbuilder
messageMenu: menu shifted: shifted

	self selectedProtocolMessage ifNotNil: [:message |
		message hasResult ifTrue: [
			menu
				add: 'explore protocol'
				action: [self class openOn: message result]].
		message selector isUnary ifTrue: [
			menu
				add: 'debug'
				action: [message debug]].
		menu addLine].
	
	^ self messageListMenu: menu shifted: shifted