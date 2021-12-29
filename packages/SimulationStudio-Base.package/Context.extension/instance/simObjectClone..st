*SimulationStudio-Base-mirror primitives
simObjectClone: anObject
	"Answer a copy the argument anObject which share's the original's instance variables, without sending it a message. This mimics the action of the VM when it clones an object.
	 Used to simulate the execution machinery by, for example, the debugger.
	 Primitive.  See Object documentation whatIsAPrimitive."

	<primitive: 148>
	self flag: #brittle. "This implementation relies on primitiveClone being implemented as a mirror primitive; however, the VM does not guarantee this. See: http://lists.squeakfoundation.org/pipermail/squeak-dev/2021-December/217866.html"
	self primitiveFailed