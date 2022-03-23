private
doPrimitive: primitiveIndex method: meth receiver: rcvr args: arguments

	| result |
	result := super doPrimitive: primitiveIndex method: meth receiver: rcvr args: arguments.
	
	((primitiveIndex >= 200 and: [primitiveIndex <= 209]) and: [(self isPrimFailToken: result) not]) ifTrue:
		["closure primitive"
		^ self customize: result].
	
	^ result