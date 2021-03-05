private
addObject: anObject

	^ (objects add: anObject -> (self prepareObject: anObject)) value