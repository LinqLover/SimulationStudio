private
checkForUnacceptedEditsIn: textViewSelector ifTrueAcceptDeferredAnd: trueBlock

	| morph |
	morph := (self dependentTextPaneWithSelector: textViewSelector) ifNil: [^ self].
	morph hasUnacceptedEdits ifFalse: [^ self].
	
	Project current addDeferredUIMessage:
		[morph handleEdit: "to ensure the editor has the correct model to access bindings"
			[morph accept]].
	
	^ trueBlock value