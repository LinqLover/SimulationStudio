context classes
contextClassForCapabilities: capabilities

	(capabilities isKindOf: Set) ifFalse: [^ self contextClassForCapabilities: capabilities asSet].
	
	self flag: #todo. "ContextClasses are never cleaned up automatically! Should we use weak data structure and pin capabilities array in simulator?"
	
	^ (ContextClasses ifNil: [ContextClasses := Dictionary new])
		at: capabilities
		ifAbsentPut: [ | class |
			class := SystemChangeNotifier uniqueInstance doSilently:
				[self basicContextClass newSubclass].
			capabilities do: [:selector |
				class
					addSelectorSilently: selector
					withMethod: (self fullContextClass >> selector) copy].
			"Seal class to avoid developer confusion."
			class theMetaClass
				addSelectorSilently: #basicAddSelector:withMethod:
					withMethod: (class theMetaClass lookupSelector: #forbiddenBasicAddSelector:withMethod:) copy;
				addSelectorSilently: #basicRemoveSelector:
					withMethod: (class theMetaClass lookupSelector: #forbiddenBasicRemoveSelector:) copy.
			class]