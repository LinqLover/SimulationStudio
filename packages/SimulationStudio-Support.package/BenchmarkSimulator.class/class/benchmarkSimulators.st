benchmarking
benchmarkSimulators
	"
	self benchmarkSimulators
	"

	| simulatorBlocks workloads |
	workloads := OrderedDictionary new
		at: '[]' put: [];
		at: '1factorial' put: [1 factorial];
		at: '10factorial' put: [10 factorial];
		at: '100factorial' put: [100 factorial];
		at: '1000factorial' put: [1000 factorial];
		at: 'regex' put: ['[\w1-3]+' asRegex];
		at: 'simulation' put: [Context runSimulated: [1 factorial]];
		yourself.
	
	simulatorBlocks := OrderedDictionary new
		at: nil put: [:block | block value];
		at: #Context put: [:block | Context runSimulated: block];
		at: #SimulationContext put: [:block | SimulationContext runSimulated: block];
		at: #Simulator put: [:block | Simulator evaluate: block];
		at: #TestSimulatorAllCapabilities put: [:block | TestSimulatorAllCapabilities evaluate: block];
		at: #TestSimulatorUnoptimized put: [:block | TestSimulatorUnoptimized evaluate: block];
		at: #MessageSendRecorderSimulator put: [:block | MessageSendRecorderSimulator evaluate: block];
		yourself.
	(Smalltalk classNamed: #Sandbox) ifNotNil: [:sandboxClass |
		simulatorBlocks at: #Sandbox put: [:block | sandboxClass evaluate: block]].
	(Smalltalk classNamed: #Sandbox2) ifNotNil: [:sandbox2Class |
		simulatorBlocks at: #Sandbox2 put: [:block | sandbox2Class evaluate: block]].	
	
	^ self selectBenchmark: workloads with: simulatorBlocks