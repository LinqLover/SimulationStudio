context classes
contextClassForCapabilities: capabilities

	(capabilities isKindOf: Set) ifFalse: [^ self contextClassForCapabilities: capabilities asSet].
	
	self flag: #todo. "ContextClasses are never cleaned up automatically! Should we use weak data structure and pin capabilities array in simulator?"
	
	^ (ContextClasses ifNil: [ContextClasses := Dictionary new])
		at: capabilities
		ifAbsentPut: [ | class |
			class := self basicContextClass newSubclass.
			capabilities do: [:selector |
				class
					addSelectorSilently: selector
					withMethod: self fullContextClass >> selector].
			"Seal class to avoid developer confusion."
			class theMetaClass
				addSelectorSilently: #basicAddSelector:withMethod:
					withMethod: (class theMetaClass lookupSelector: #forbiddenBasicAddSelector:withMethod:);
				addSelectorSilently: #basicRemoveSelector:
					withMethod: (class theMetaClass lookupSelector: #forbiddenBasicRemoveSelector:).
			class]