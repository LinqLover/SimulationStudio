context classes
cleanUpContextClasses

	ContextClasses ifNil: [^ self].
	ContextClasses do: [:class | class removeFromSystem].
	ContextClasses := nil.