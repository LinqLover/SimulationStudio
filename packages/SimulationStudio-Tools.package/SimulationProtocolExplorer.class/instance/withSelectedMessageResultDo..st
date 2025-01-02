actions
withSelectedMessageResultDo: aBlock

	| message |
	message := self selectedProtocolMessage ifNil: [^ self].
	message
		assureResult;
		ifResult: [:result | aBlock value: result]
		ifError: [:error | message debug].