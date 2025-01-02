initialize-release
initializePragmaticMethods

	pragmaticMethods := IdentityDictionary new.
	self addPragmaticMethodsTo: pragmaticMethods.
	self addPragmaticMultiMethodsTo: pragmaticMethods.
	
	pragmaticClasses := IdentityDictionary new.
	self addPragmaticClassesTo: pragmaticClasses.