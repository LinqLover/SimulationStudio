toolbuilder
messageListMenuSimulation: aMenu
	<messageListMenu>
	<menuPriority: 0>

	aMenu
		add: 'debug'
		action: #debugMessage.
	aMenu addLine.
	^ aMenu