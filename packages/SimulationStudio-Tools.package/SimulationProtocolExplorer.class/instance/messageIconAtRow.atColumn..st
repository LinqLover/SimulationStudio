accessing
messageIconAtRow: rowIndex atColumn: columnIndex

	| message |
	message := self messages at: rowIndex.
	^ self
		messageIconFor: message
		atColumnNamed: (self messageColumnNameAt: columnIndex)