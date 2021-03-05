private
writableObjectFor: anObject

	^ self prepareObject: (objects
		at: anObject
		ifAbsentPut: [anObject shallowCopy])