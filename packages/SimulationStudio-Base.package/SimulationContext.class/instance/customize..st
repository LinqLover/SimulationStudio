converting
customize: aContext
	"Answer a version of aContext that is converted to the class of the receiver."

	aContext == self ifTrue: [^ aContext].
	(aContext isKindOf: self class) ifTrue: [^ aContext].
	^ self basicCustomize: aContext