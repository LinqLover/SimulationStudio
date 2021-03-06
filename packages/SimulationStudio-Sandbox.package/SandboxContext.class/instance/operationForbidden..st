private-exceptions
operationForbidden: messageText

	^ SandboxOperationForbidden new
		messageText: messageText;
		tag: self;
		signal