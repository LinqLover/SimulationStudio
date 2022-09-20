accessing
object: anObject

	object := anObject.
	
	self changed: #object.
	
	selectedClasses removeAll.
	self setClass: anObject class selected: true.
	(self categories detect: [:cat | cat = 'accessing'] ifNone: [self categories at: 1 ifAbsent: [nil]]) ifNotNil: [:cat |
		self selectCategory: cat].