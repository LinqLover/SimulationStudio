tests
testExecuteQuickMethod

	| object |
	object := MessageSend new.
	object receiver: nil.
	
	self sandboxClass evaluate: [
		object receiver: self.
		self assert: self equals: (object executeMethod: object class >> #receiver).
		self assert: self equals: (object withArgs: #() executeMethod: object class >> #receiver)].
	
	self assert: nil equals: object receiver.