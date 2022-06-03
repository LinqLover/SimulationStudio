tests
testMNUNoSuper
	"Lightweight extract from ContextTest>>#testMessageNotUnderstood."

	self
		should: [ProtoObject new foo]
		raise: MessageNotUnderstood.
	self
		should: [Compiler evaluate: 'super foo' for: Object new]
		raise: MessageNotUnderstood.