controlling
send: selector to: rcvr with: arguments

	^ simulator context: self send: selector to: rcvr with: arguments do: [:theSelector :theReceiver :theArguments | super send: theSelector to: theReceiver with: theArguments]