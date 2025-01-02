*SimulationStudio-Base-mirror primitives
simObjectIdentityHash: anObject
	"Answer a SmallInteger whose value is related to anObject's identity, without executing arbitrary methods. This mimics the behavior of #identityHash as it is defined in the base system.
	 Used to simulate the execution machinery by, for example, the debugger.
	 Primitive.  See Object documentation whatIsAPrimitive."

	| class |
	class := self objectClass: anObject.
	(SmallInteger == class or: [Character == class or: [SmallFloat64 == class or: [Metaclass == (self objectClass: class)]]])
		ifTrue: [^ anObject identityHash].
	^ self simBasicObjectIdentityHash: anObject