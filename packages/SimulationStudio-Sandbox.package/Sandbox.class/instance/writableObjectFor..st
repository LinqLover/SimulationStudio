private
writableObjectFor: anObject

	^ objects
		at: anObject
		ifAbsentPut: [| writableObject |
			writableObject := Mirror simObjectShallowCopy: anObject.
			((Mirror simObjectIsReadOnly: anObject) and: [(Mirror objectClass: anObject) isImmediateClass not])
				ifTrue: [Mirror simObject: writableObject setIsReadOnly: true].
			writableObject]