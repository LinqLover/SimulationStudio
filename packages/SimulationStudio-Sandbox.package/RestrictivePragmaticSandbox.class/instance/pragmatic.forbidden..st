private
pragmatic: aContext forbidden: messageText

	^ self nextSimulator context: aContext primitiveFailTokenFor:
		[self nextSimulator context: aContext activateOperationForbidden: messageText]