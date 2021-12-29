actions
inspectSelectedMessage

	self class openOn: (self performCarefully: self selectedMessage ifFailed: [:error | ^ self inform: error]).