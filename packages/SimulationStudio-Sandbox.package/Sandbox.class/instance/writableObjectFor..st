private
writableObjectFor: anObject

	^ objects
		at: anObject
		ifAbsentPut: [anObject shallowCopy]