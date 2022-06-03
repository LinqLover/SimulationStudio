tests
testRecursiveMNU
	"Lightweight extract from ContextTest>>#testMessageNotUnderstood."

	thisContext simCustomizationLevel > 0 ifFalse: [^ self "This woudl crash the VM"].
	TestEmptyClass new foo. "should fail!"