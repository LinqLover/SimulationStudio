instruction decoding
pushReceiver

	^ simulator context: self doPushReceiver: [super pushReceiver]