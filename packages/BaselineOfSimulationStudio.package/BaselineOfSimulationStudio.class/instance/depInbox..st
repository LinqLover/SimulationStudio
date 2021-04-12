scripts
depInbox: aString

	^ self
		depSqueakSource: #inbox
		name: aString
		targetRepository: #trunk