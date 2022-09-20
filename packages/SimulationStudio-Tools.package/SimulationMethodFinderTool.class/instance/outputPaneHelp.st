accessing - toolbuilder
outputPaneHelp

	^ self searchMode caseOf:
		{[#value] -> ['value'].
		[#predicate] -> ['answer > 0'].
		[#sendingPredicate] -> [
'var := OrderedCollection new.
messageSend value.
var notEmpty']}