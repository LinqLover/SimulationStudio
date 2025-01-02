private
lookupSelector: aSymbol inClass: aClass

	| lookupClass |
	lookupClass := self readableObjectFor: aClass.
	[lookupClass == nil] whileFalse:
		[self
			simulatedClass: lookupClass
			compiledMethodAt: aSymbol
			ifPresent: [:method | ^ method].
		lookupClass := self readableObjectFor: (Mirror object: lookupClass instVarAt: 1 "superclass")].
	^ nil