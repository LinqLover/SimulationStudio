controlling
context: aContext step: aBlock

	(pcsPerMethod at: aContext method ifAbsentPut: [Set new])
		add: aContext pc.
	
	^ super context: aContext step: aBlock