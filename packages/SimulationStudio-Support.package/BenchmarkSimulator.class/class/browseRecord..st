recording
browseRecord: aBlock
	"
	BenchmarkSimulator browseRecord: [10 factorial].
	BenchmarkSimulator browseRecord: [PluggableTextMorph new imageForm].
	"

	^ (self record: aBlock) browseRecord