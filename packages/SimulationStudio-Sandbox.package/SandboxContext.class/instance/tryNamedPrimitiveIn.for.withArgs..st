private
tryNamedPrimitiveIn: aCompiledMethod for: aReceiver withArgs: arguments

	self flag: #suspicious.
	^ self shouldNotImplement: 'Use #doNamedPrimitiveIn:for:withArgs:'