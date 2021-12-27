*SimulationStudio-Base-mirror primitives
simObjectIdentityHash: anObject
	"Answer a SmallInteger whose value is related to anObject's identity, without executing arbitrary methods. This mimics the action of the VM when it fetches an object's identity hash.
	 Used to simulate the execution machinery by, for example, the debugger.
	 Primitive.  See Object documentation whatIsAPrimitive."

	<primitive: 75>
	| class |
	class := self objectClass: anObject.
	(SmallInteger == class or: [Character == class] or: [SmallFloat64 == class] or: [Behavior == class])
		ifTrue: [^ anObject identityHash].
	^ self primitiveFailed