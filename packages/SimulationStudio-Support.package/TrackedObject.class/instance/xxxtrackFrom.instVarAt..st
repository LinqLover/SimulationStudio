accessing
xxxtrackFrom: aContext instVarAt: instVarIndex

	((instVars ifNil: [instVars := IdentityDictionary new])
		at: aContext ifAbsentPut: [Set new])
			add: instVarIndex.