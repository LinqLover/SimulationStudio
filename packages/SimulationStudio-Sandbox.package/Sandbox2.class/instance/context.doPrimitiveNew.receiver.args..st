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
			| hashResult |
			result superclass ifNil: [
				result perform: #initialize withArguments: #() inSuperclass: Behavior].
			
			"In many cases, this primitive will already be executed when storing the class result in objects. However, this is not always the case!"
			hashResult := result tryPrimitive: 175 "primitiveBehaviorHash" withArgs: #().
			(aContext isPrimFailToken: hashResult) ifTrue: [^ hashResult].
			
			"Note that we could harden the sandbox here by not adding result to objects so that all new methods will only be visible from #lookupSelector:inClass:. However, we forego this step for now as objects from the simulated code should be touched by the simulator using mirror primitives only anyway."].
	
	^ (aContext isPrimFailToken: result)
		ifTrue: [result]
		ifFalse: [aContext push: (self addObject: result)]