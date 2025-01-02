pragmatic methods - DateAndTime
doDateAndTime: aDateAndTime perform: selector context: aContext
	<pragmaticClass: #DateAndTime selectors: #(day month year)>

	self assertUnmodifiedObject: aDateAndTime.
	
	^ aDateAndTime perform: selector