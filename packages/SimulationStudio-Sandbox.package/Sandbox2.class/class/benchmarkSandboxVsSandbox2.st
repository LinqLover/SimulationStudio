benchmarks
benchmarkSandboxVsSandbox2
	"
	self benchmarkSandboxVsSandbox2 explore
	"

	| workloads |
	workloads := OrderedDictionary new
		at: #factorial put: [100 factorial];
		at: #regex put: ['\w+' asRegex];
		yourself.
	
	^ workloads collect: [:workload |
		{Sandbox. Sandbox2}
			collect: [:sandbox | sandbox ->
				(BenchmarkSimulator record:
					[sandbox evaluate: workload])]
			as: Dictionary]