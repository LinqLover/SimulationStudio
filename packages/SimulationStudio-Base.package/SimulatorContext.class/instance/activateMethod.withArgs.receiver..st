controlling
activateMethod: aCompiledMethod withArgs: arguments receiver: rcvr

	^ simulator context: self activateMethod: aCompiledMethod withArgs: arguments receiver: rcvr do: [:theCompiledMethod :theArguments :theReceiver | super activateMethod: theCompiledMethod withArgs: theArguments receiver: theReceiver]