controlling
context: aContext activateMethod: aCompiledMethod withArgs: arguments receiver: receiver do: aBlock

	| args result selector |
	selector := pragmaticMethods at: aCompiledMethod ifAbsent: nil.
	selector ifNil:
		[selector := pragmaticClasses at: aCompiledMethod methodClass ifAbsent: nil.
		selector ifNotNil: [selector := {selector}]].
	
	selector ifNil:
		[^ super context: aContext activateMethod: aCompiledMethod withArgs: arguments receiver: receiver do: aBlock].
	
	args := {receiver}.
	selector isArray
		ifTrue:
			[selector := selector first.
			args := args copyWith: aCompiledMethod selector.
			args size < selector numArgs ifTrue:
				[args := args copyWith: arguments]]
		ifFalse:
			[args := args , arguments].
	args size < selector numArgs ifTrue:
		[args := args copyWith: aContext].
	result :=
		[self assert: ((aContext objectClass: receiver) includesBehavior: aCompiledMethod methodClass).
		self perform: selector withArguments: args]
			on: Error do:
				[^ super context: aContext activateMethod: aCompiledMethod withArgs: arguments receiver: receiver do: aBlock].
	^ aContext push: result