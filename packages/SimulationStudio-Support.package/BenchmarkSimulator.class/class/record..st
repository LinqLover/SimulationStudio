recording
record: aBlock
	"
	BenchmarkSimulator record: [10 factorial].
	BenchmarkSimulator record: [PluggableTextMorph new imageForm].
	"

	^ self new record: aBlock