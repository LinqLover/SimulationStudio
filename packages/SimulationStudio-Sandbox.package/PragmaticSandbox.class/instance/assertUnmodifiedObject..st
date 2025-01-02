private
assertUnmodifiedObject: anObject

	self assert: (self nextSimulator hasModifiedObject: anObject) not.