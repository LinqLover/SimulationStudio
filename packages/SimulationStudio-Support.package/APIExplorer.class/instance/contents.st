accessing
contents

	self selectedMessage ifNil: [^ nil].
	
	^ self object class ultimateSourceCodeAt: self selectedMessage ifAbsent: [self error]