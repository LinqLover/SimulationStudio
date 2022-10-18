toolbuilder
labelString

	^ '{1} on {2}' format:
		{self appName.
		[self object printStringLimitedTo: 40] ifError: ['a ' , self object class]}