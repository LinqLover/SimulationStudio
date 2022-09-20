accessing
setClass: aClass selected: aBoolean

	aBoolean
		ifTrue: [self selectedClasses add: aClass]
		ifFalse: [self selectedClasses remove: aClass].
	
	self changed: #selectedClasses.