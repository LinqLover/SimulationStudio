toolbuilder
addModelItemsToWindowMenu: aMenu 
	
	aMenu addLine.
	aMenu
		add: 'show transcripter'
		target: self
		action: #showTranscripter.