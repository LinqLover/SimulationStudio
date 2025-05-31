controlling
context: aContext doPrimitive: primitiveIndex method: aCompiledMethod receiver: receiver args: arguments do: aBlock

	self flag: #todo. "Do this only for non-simulated prims!"
	^ super
		context: aContext
		doPrimitive: primitiveIndex
		method: aCompiledMethod
		receiver: receiver untracking
		args: (arguments collect: [:argument | argument untracking])
		do: aBlock