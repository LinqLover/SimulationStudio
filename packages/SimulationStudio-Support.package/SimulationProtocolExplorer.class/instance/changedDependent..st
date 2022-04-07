updating
changedDependent: aspect

	aspect
		caseOf:
			{[#contents] ->
				[contents := nil.
				self contents].
			[#currentCompiledMethod] ->
				[currentCompiledMethod := nil.
				self currentCompiledMethod.
				self decorateButtons].
			[#messages] ->
				[messages := nil.
				(self messages includes: self selectedProtocolMessage)
					ifFalse: [self selectProtocolMessage: nil]]}
		otherwise: [].
	
	self changed: aspect.