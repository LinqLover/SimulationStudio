private
doPrimitive: primitiveIndex method: meth receiver: rcvr args: arguments

	^ simulator context: self doPrimitive: primitiveIndex method: meth receiver: rcvr args: arguments do: [:thePrimitiveIndex :theCompiledMethod :theReceiver :theArguments | super doPrimitive: thePrimitiveIndex method: theCompiledMethod receiver: theReceiver args: theArguments]