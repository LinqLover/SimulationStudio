instruction decoding
pushActiveContext

	^ simulator context: self doPushActiveContext: [super pushActiveContext]