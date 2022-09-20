toolbuilder
contents

	| theContents |
	theContents := super contents.
	theContents isEmptyOrNil ifTrue: [^ nil].
	^ theContents