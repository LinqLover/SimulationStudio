controlling
executeMethod: meth forSelector: selector withArgs: arguments receiver: rcvr

	^ simulator context: self executeMethod: meth forSelector: selector withArgs: arguments receiver: rcvr do: [:theMethod :theSelector :theArguments :theReceiver | super executeMethod: theMethod forSelector: theSelector withArgs: theArguments receiver: theReceiver]