tests
testOperationForbidden

	self sandboxClass evaluate: [self
		should: [FileDirectory default exists]
		raise: SandboxOperationForbidden].