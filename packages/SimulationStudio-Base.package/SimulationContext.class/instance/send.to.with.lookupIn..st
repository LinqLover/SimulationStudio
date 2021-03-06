controlling
send: selector to: receiver with: arguments lookupIn: lookupClass

	^ (super send: selector to: receiver with: arguments lookupIn: lookupClass)
		customizeFor: self