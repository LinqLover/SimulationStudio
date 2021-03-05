private
readableObjectFor: anObject

	^ objects
		at: anObject
		ifAbsent: [anObject]