converting
customize: aContext
	"Answer a version of aContext that is converted to the class of the receiver."

	aContext == self ifTrue: [^ aContext].
	aContext ifNil: [^ nil].
	(aContext isKindOf: self class) ifTrue: [^ aContext].
	^ self basicCustomize: aContext