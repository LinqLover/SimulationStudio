scripts
installPreviewDependenciesForTests

	^ self installPreviewDependencies: {
		self depInbox: 'SUnit-ct.125'. "TestCase>>#runCaseWithoutTimeout for SandboxKernelTest"
		self depInbox: 'SUnit-ct.132'. "TestCase>>#assert:equals:description: with lazy descriptions"
		self depInbox: 'Kernel-ct.1407'. "Fixes Context >> #isPrimFailToken: for ProtoObjects"
	}