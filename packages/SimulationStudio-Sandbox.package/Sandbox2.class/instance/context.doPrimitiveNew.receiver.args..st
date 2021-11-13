controlling
context: aContext doPrimitiveNew: primitiveIndex receiver: rcvr args: arguments

	| result class |
	result := (self readableObjectFor: rcvr)
		tryPrimitive: primitiveIndex withArgs: arguments.
	
	"Special treatment for Metaclass instances and their instances. Metaclass instance instances are initialized correctly by them VM only if the following order of operations has been ensured:
		0. aMetaclass := Metaclass primitiveNew.
		1. aMetaclass(Behavior) initialize
		2. aMetaclass primitiveBehaviorHash.
		n. aMetaclassInstance := metaclassInstance primitiveNew.
		n+1. aMetaclassInstance primitiveClass.
	Violations to this order can cause the VM to crash! Since Sandbox objects calls primitiveBehaviorHash, we guarantee the right order here."
	((class := aContext objectClass: result) == Metaclass or: [(aContext objectClass: class) == Metaclass])
		ifTrue: [
			result perform: #initialize withArguments: #() inSuperclass: Behavior.
			self flag: #todo. "Should we add result members to sandbox here?"].
	
	^ (aContext isPrimFailToken: result)
		ifTrue: [result]
		ifFalse: [aContext push: (self addObject: result)]