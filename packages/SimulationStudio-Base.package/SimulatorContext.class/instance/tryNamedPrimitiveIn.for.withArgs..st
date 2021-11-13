private
tryNamedPrimitiveIn: aCompiledMethod for: rcvr withArgs: arguments

	^ simulator context: self tryNamedPrimitiveIn: aCompiledMethod for: rcvr withArgs: arguments do: [:theCompiledMethod :theReceiver :theArguments | super tryNamedPrimitiveIn: theCompiledMethod for: theReceiver withArgs: theArguments]