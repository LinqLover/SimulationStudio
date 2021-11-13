controlling
send: selector to: rcvr with: arguments lookupIn: lookupClass

	^ simulator context: self send: selector to: rcvr with: arguments lookupIn: lookupClass do: [:theSelector :theReceiver :theArguments :theLookupClass | super send: theSelector to: theReceiver with: theArguments lookupIn: theLookupClass]