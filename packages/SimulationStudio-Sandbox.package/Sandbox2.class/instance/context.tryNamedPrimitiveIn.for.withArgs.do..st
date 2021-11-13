controlling
context: aContext tryNamedPrimitiveIn: aCompiledMethod for: receiver withArgs: arguments do: aBlock

	self flag: #suspicious.
	^ self shouldNotImplement: 'Use #doNamedPrimitiveIn:for:withArgs:'