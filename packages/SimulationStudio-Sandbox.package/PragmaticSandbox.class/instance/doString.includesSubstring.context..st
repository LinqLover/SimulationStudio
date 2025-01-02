pragmatic methods - String
doString: aString includesSubstring: anotherString context: aContext
	<pragmaticClass: #String selector: #includesSubstring:>

	self assertUnmodifiedObject: aString.
	self assert: ((aContext objectClass: anotherString) includesBehavior: String).
	self assertUnmodifiedObject: anotherString.	
	
	^ aString includesSubstring: anotherString