tests
testCompile

	| result token |
	self assert: UUID nilUUID equals: self someToken.
	
	token := UUID new asString.
	result := self sandboxClass disableLoggingAndNotifyingDuringCompilation:
		[self sandboxClass evaluate: [
			self class compile: 'someToken ^' , token printString.
			self someToken]].
	
	self assert: token equals: result.
	self assert: UUID nilUUID equals: self someToken.