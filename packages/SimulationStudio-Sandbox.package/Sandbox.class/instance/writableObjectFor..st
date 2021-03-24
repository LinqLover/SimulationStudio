private
writableObjectFor: anObject

	^ objects
		at: anObject
		ifAbsentPut: [| writableObject |
			writableObject := anObject shallowCopy.
			(anObject isReadOnlyObject and: [anObject class isImmediateClass not])
				ifTrue: [writableObject setIsReadOnlyObject: true].
			writableObject]