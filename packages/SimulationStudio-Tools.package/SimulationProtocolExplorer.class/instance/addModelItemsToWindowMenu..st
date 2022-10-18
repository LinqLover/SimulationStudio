toolbuilder
addModelItemsToWindowMenu: menu

	super addModelItemsToWindowMenu: menu.
	
	menu addLine.
	SimulatorApp appMenu: menu.