private
activateOperationForbidden: messageText

	self flag: #todo. "Raise SandboxError here if configured"
	^ self send: #operationForbidden: to: self with: {messageText}