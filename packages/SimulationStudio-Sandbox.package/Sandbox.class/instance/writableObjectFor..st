private
writableObjectFor: anObject

	^ objects
		at: anObject
		ifAbsentPut: [| writableObject |
			writableObject := thisContext simObjectShallowCopy: anObject.
			((thisContext simObjectIsReadOnly: anObject) and: [(thisContext objectClass: anObject) isImmediateClass not])
				ifTrue: [thisContext simObject: writableObject setIsReadOnly: true].
			writableObject]