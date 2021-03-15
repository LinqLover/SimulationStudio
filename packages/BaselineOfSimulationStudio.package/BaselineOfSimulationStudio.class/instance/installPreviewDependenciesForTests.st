scripts
installPreviewDependenciesForTests

	^ self installPreviewDependencies: {
		self depInbox: 'SUnit-ct.125'. "TestCase>>#runCaseWithoutTimeout for SandboxKernelTest"
		self depInbox: 'SUnit-ct.132'. "TestCase>>#assert:equals:description: with lazy descriptions"
		self depInbox: 'Tests-ct.447'. "Fixes and supplements BecomeTest"
		self depInbox: 'KernelTests-ct.375'. "Renames MethodContextTest to ContextTest"
		self depInbox: 'Kernel-ct.1382'. "Removes simulation guard from #newProcess"
	}