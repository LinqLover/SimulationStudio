scripts
installPreviewDependenciesForTestsSandbox

	^ self installPreviewDependencies: {
		self depInbox: 'SUnit-ct.125'. "TestCase>>#runCaseWithoutTimeout for SandboxKernelTest"
		self depInbox: 'SUnit-ct.126'. "TestCase>>#assert:equals:description: with lazy descriptions"
		self depInbox: 'Tests-ct.447'. "Fixes and supplements BecomeTest"
	}