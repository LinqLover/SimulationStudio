accessing - toolbuilder
contents

	self selection ifNil: [^ self emptyContents].
	^ super contents