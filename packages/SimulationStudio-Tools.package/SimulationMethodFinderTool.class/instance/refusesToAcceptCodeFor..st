accessing - toolbuilder
refusesToAcceptCodeFor: requestor

	(#(inputsText outputText) includes: requestor knownName) ifTrue: [^ false].
	
	^ super refusesToAcceptCodeFor: requestor