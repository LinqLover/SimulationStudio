pragmatic methods - String
doStringAsLowercase: aString
	<pragmaticClass: #String selector: #asLowercase>

	self assertUnmodifiedObject: aString.
	
	^ aString asLowercase