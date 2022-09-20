code pane
aboutToStyle: styler

	| result |
	result := super aboutToStyle: styler.
	styler parseAMethod: self selectedProtocolMessage notNil.
	^ result or: [self selectedProtocolMessage isNil]