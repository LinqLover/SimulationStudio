stepping
context: aContext step: aBlock

	self incrementStepCount.
	
	^ super context: aContext step: aBlock