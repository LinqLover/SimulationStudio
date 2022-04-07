toolbuilder
mainMessageListMenu: aMenu
	<messageListMenuShifted: false>

	^ aMenu
		addTranslatedList: #(
			('what to show...'			offerWhatToShowMenu));
		add: (self isBreakOnEntry ifTrue: ['<on>'] ifFalse: ['<off>']) , 'break on entry' translated
			action: #toggleBreakOnEntry;
		addTranslatedList: #(
			-
			('browse full (b)' 			browseMethodFull)
			('browse hierarchy (h)'		browseClassHierarchy)
			('browse protocol (p)'			browseFullProtocol)
			-
			('fileOut'					fileOutMessage)
			('printOut'					printOutMessage)
			('copy selector (c)'			copySelector)
			('copy reference (C)'		copyReference)
			-
			('senders of... (n)'			browseSendersOfMessages)
			('implementors of... (m)'		browseMessages)
			('inheritance (i)'			methodHierarchy)
			('versions (v)'				browseVersions)
			-
			('references... (r)'			browseVariableReferences)
			('assignments... (a)'			browseVariableAssignments)
			('class refs (N)'			browseClassRefs)
			-
			('remove method (x)'			removeMessage)
			('explore method'			exploreMethod)
			('inspect method'			inspectMethod));
		yourself