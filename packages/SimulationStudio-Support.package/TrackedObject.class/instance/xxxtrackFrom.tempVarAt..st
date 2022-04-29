accessing
xxxtrackFrom: aContext tempVarAt: tempVarIndex

	((tempVars ifNil: [tempVars := IdentityDictionary new])
		at: aContext ifAbsentPut: [Set new])
			add: tempVarIndex.