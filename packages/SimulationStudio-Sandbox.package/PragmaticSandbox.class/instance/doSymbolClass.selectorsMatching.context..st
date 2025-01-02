pragmatic methods - Symbol
doSymbolClass: aSymbolClass selectorsMatching: aStringPattern context: aContext
	<pragmaticClass: #'Symbol class' selector: #selectorsMatching:>

	self assertUnmodifiedObject: aSymbolClass.
	self assertUnmodifiedObject: (aSymbolClass classPool at: #NewSymbols).
	self assertUnmodifiedObject: (aSymbolClass classPool at: #NewSymbols) array.
	self assertUnmodifiedObject: (aSymbolClass classPool at: #SymbolTable).
	self assertUnmodifiedObject: (aSymbolClass classPool at: #SymbolTable) array.
	self assert: ((aContext objectClass: aStringPattern) includesBehavior: String).
	self assertUnmodifiedObject: aStringPattern.
	
	^ Symbol selectorsMatching: aStringPattern