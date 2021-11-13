instruction decoding
doPop

	^ simulator context: self doPop: [super doPop]