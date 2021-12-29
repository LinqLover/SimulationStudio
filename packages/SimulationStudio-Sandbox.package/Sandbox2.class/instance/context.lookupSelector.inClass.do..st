controlling
context: aContext lookupSelector: aSymbol inClass: aClass do: aBlock

	| lookupClass |
	lookupClass := self readableObjectFor: aClass.
	[lookupClass == nil] whileFalse:
		[self
			context: aContext
			simulatedClass: lookupClass
			compiledMethodAt: aSymbol
			ifPresent: [:method | ^ method].
		lookupClass := self readableObjectFor: (aContext object: lookupClass instVarAt: 1 "superclass")].
	^ nil