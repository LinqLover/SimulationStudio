toolbuilder
addModelItemsToWindowMenu: menu

	super addModelItemsToWindowMenu: menu.
	
	menu addLine.
	menu
		add: 'show transcripter'
		target: self
		action: #showTranscripter.
	
	menu addLine.
	SimulatorApp appMenu: menu.