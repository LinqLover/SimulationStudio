*SimulationStudio-Base-mirror primitives
simObjectIsReadOnly: anObject
	"Answer if the argument is read-only without sending it a message. This mimics the action of the VM when an object is tested for writeability. See Object >> #isReadOnlyObject."

	<primitive: 163 error: ec>
	self flag: #brittle. "This implementation relies on primitiveGetImmutability being implemented as a mirror primitive; however, the VM does not guarantee this. See: http://lists.squeakfoundation.org/pipermail/squeak-dev/2021-December/217866.html"
	^ (self objectClass: anObject) isImmediateClass