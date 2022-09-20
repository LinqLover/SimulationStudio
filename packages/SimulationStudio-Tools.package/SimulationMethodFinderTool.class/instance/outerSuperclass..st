accessing
outerSuperclass: aClassDescription

	finder outerSuperclass: aClassDescription.
	
	self changed: #outerSuperclassLabel.
	self changed: #hasOuterSuperclass.