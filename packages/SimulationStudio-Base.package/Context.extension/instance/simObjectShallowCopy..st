*SimulationStudio-Base-mirror primitives
simObjectShallowCopy: anObject
	"Answer a copy of the argument anObject which share's the original's instance variables, without executing an arbitrary method.
	 Used to simulate the execution machinery by, for example, the debugger."

	<primitive: 148 error: errorCode>
	self flag: #brittle. "This implementation relies on primitiveClone being implemented as a mirror primitive; however, the VM does not guarantee this. See: http://lists.squeakfoundation.org/pipermail/squeak-dev/2021-December/217866.html"
	
	"Fall back to Object>>#shallowCopy for dealing with low space failures."
	^ "self
		receiver:" anObject
		tryPrimitive: 100 "primitivePerformInSuperclass"
		withArgs: {#shallowCopy. #(). Object}