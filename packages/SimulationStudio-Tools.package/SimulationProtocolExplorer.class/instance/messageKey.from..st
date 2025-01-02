toolbuilder
messageKey: aCharacter from: view

	^ aCharacter
		caseOf:
			{[$i] -> [self inspectSelectedMessage].
			[$I] -> [self exploreSelectedMessage].
			[$e] -> [self exploreProtocolOfSelectedMessage].
			[$d] -> [self debugSelectedMessage]}
		otherwise: [self messageListKey: aCharacter from: view]