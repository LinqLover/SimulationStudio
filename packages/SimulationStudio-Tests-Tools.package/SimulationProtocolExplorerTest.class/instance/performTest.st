running
performTest

	^ UIManager simDontAttachToCursorDuring:
		[super performTest]