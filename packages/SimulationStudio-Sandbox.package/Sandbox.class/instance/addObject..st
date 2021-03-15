private
addObject: anObject

	^ (objects add: (Association basicNew key: anObject value: (self prepareObject: anObject))) value