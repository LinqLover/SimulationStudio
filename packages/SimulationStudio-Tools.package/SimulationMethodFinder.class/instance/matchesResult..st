private
matchesResult: answer

	^ self searchMode caseOf:
		{[#value] -> [answer = expectedAnswer].
		[#predicate] -> [predicate value: answer]}