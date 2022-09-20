actions
inspectSelectedMessage

	| message |
	message := self selectedProtocolMessage ifNil: [^ self].
	message
		assureResult;
		ifResult: [:result | self class openOn: result]
		ifError: [:result | message debug].