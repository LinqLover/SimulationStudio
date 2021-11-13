controlling
context: aContext activateOperationForbidden: messageText

	self flag: #todo. "Raise SandboxError here if configured"
	^ aContext send: #operationForbidden: to: self with: {messageText}