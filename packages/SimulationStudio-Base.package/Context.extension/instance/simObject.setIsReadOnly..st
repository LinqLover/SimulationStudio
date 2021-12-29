*SimulationStudio-Base-mirror primitives
simObject: anObject setIsReadOnly: aBoolean
	"Set the read-only flag of the argument anObject to the given value aBoolean and answer the previous value of the flag, without sending a message to anObject. This mimics the action of the VM when an object is set as read-only or writeable. See Object >> #setIsReadOnlyObject:."

	<primitive: 164 error: ec>
	self flag: #brittle. "This implementation relies on primitiveSetImmutability being implemented as a mirror primitive; however, the VM does not guarantee this. See: http://lists.squeakfoundation.org/pipermail/squeak-dev/2021-December/217866.html"
	self primitiveFailed