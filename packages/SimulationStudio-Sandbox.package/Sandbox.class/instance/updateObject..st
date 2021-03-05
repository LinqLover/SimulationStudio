private
updateObject: anObject

	self flag: #suspicious. "Very suspicious - why this special treatment? Generalize for other primitives, don't hard-code thisContext, and document."
	
	((thisContext objectClass: anObject) includesBehavior: BitBlt)
		ifTrue: [
			"Any BitBlt primitive modifies destForm. Thus always sandbox it. This is horrible! We appear not even to need it. Reproduce use case!"
			"anObject instVarNamed: 'destForm' put:
				(self writableObjectFor: (anObject instVarNamed: 'destForm'))"].