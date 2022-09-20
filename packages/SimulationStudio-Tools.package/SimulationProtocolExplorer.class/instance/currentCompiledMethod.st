accessing
currentCompiledMethod

	^ currentCompiledMethod
		ifNil: [currentCompiledMethod := self object class lookupSelector: self selectedSelector]