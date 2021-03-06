tests
testOperationForbidden

	Sandbox evaluate: [self
		should: [FileDirectory default exists]
		raise: SandboxOperationForbidden].