scripts
installPreviewDependenciesForTests

	^ self installPreviewDependencies: {
		self depInbox: 'SUnit-ct.125'. "TestCase>>#runCaseWithoutTimeout for SandboxKernelTest"
		self depInbox: 'SUnit-ct.132'. "TestCase>>#assert:equals:description: with lazy descriptions"
		self depInbox: 'Tests-ct.447'. "Fixes and supplements BecomeTest"
		self depInbox: 'KernelTests-ct.375'. "Renames MethodContextTest to ContextTest"
		self depChangeset: 'https://gist.githubusercontent.com/LinqLover/a37216b502563e7b17ffac17220def02/raw/4fd97a9a36d674782007098434f24788c48ad8ed/Kernel-ct.%257B1382,1383%257D.1.cs'. "Merge result:
			Kernel-ct.1382: Removes simulation guard from #newProcess
			Kernel-ct.1383: Fixes simulation of #perform:... primitives 83, 84, and 100"
	}