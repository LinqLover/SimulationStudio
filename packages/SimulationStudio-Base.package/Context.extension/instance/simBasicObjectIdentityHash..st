*SimulationStudio-Base-mirror primitives
simBasicObjectIdentityHash: anObject
	"Answer the identity hash of the argument anObject without sending it a message. This mimics the action of the VM when it fetches an object's identity hash. Private! Only to be sent to instances of classes that do not overwrite #identityHash in the base system. Sending primitiveIdentityHash to value types or behaviors may damage the image. Usually, you should send #simObjectIdentityHash: instead.
	Used to simulate the execution machinery by, for example, the debugger.
	Primitive.  See Object documentation whatIsAPrimitive."

	<primitive: 75>
	self flag: #brittle. "This implementation relies on primitiveIdentityHash being implemented as a mirror primitive; however, the VM does not guarantee this. See: http://lists.squeakfoundation.org/pipermail/squeak-dev/2021-December/217866.html"
	^ self primitiveFailed