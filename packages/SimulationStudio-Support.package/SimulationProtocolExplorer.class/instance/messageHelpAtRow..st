accessing
messageHelpAtRow: rowIndex

	| message |
	message := self messages at: rowIndex.
	^ self messageHelpFor: message