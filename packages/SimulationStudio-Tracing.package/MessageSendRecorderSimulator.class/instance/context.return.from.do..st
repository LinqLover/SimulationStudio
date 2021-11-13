controlling
context: aContext return: value from: sender do: aBlock

	self recordReturn: value to: sender sender.
	
	^ super context: aContext return: value from: sender do: aBlock