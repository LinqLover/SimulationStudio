toolbuilder
messageMenu: menu shifted: shifted

	self selectedProtocolMessage ifNotNil: [:message |
		message hasResult ifTrue: [
			menu
				add: 'inspect (i)' action:
					[ToolSet inspect: message result];
				add: 'explore (I)' action:
					[ToolSet explore: message result];
				add: 'explore protocol (e)' action:
					[self class openOn: message result]].
		message selector isUnary ifTrue: [
			menu
				add: 'debug (d)'
				action: [message debug]].
		menu addLine].
	
	^ self messageListMenu: menu shifted: shifted