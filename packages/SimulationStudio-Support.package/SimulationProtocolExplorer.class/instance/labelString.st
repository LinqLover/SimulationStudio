toolbuilder
labelString

	^ 'Protocol Explorer on ' , ([self object printStringLimitedTo: 40] ifError: ['a ' , self rootObject class])