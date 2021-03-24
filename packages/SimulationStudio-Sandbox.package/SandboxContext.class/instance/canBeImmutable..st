private
canBeImmutable: anObject
	"See InterpreterPrimitives>>canBeImmutable:."

	| class processor |
	class := self objectClass: anObject.
	
	class isEphemeronClass ifTrue: [^ false].
	class isWeak ifTrue: [^ false].
	({Context. LinkedList. Process. Semaphore} includes: class) ifTrue: [^ false].
	({processor := sandbox readableObjectFor: Processor. sandbox readableObjectFor: (processor instVarAt: 1 "quiescentProcessLists")} includes: anObject) ifTrue: [^ false].
	
	^ true