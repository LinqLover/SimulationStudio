scripts
installPreviewDependenciesForTests

	^ self installPreviewDependencies: {
		self depInbox: 'SUnit-ct.125'. "TestCase>>#runCaseWithoutTimeout for SandboxKernelTest"
		self depInbox: 'SUnit-ct.132'. "TestCase>>#assert:equals:description: with lazy descriptions"
		self depInbox: 'Tests-ct.447'. "Fixes and supplements BecomeTest"
		self depInbox: 'KernelTests-ct.375'. "Renames MethodContextTest to ContextTest"
		self depChangeset: 'https://gist.githubusercontent.com/LinqLover/a37216b502563e7b17ffac17220def02/raw/0adf842d268f2177905b98f3e5acd767a15b0cdc/Kernel-ct.%257B1382,1383,1369%257D.1.cs'. "Merge result:
			Kernel-ct.1382: Removes simulation guard from #newProcess
			Kernel-ct.1383: Fixes simulation of #perform:... primitives 83, 84, and 100
			Kernel-ct.1369: Fixes Context >> #isPrimFailToken: for ProtoObjects"
	}
