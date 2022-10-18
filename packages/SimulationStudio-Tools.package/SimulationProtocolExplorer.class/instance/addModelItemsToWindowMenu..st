toolbuilder
addModelItemsToWindowMenu: menu

	super addModelItemsToWindowMenu: menu.
	
	menu addLine.
	Simulator appMenu: menu.