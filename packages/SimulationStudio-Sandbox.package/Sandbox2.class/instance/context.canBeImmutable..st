private - object access
context: aContext canBeImmutable: anObject
	"See InterpreterPrimitives>>canBeImmutable:."

	| class processor |
	class := aContext objectClass: anObject.
	
	class isEphemeronClass ifTrue: [^ false].
	class isWeak ifTrue: [^ false].
	({Context. LinkedList. Process. Semaphore} includes: class) ifTrue: [^ false].
	({processor := self readableObjectFor: Processor. self readableObjectFor: (processor instVarAt: 1 "quiescentProcessLists")} includes: anObject) ifTrue: [^ false].
	
	^ true