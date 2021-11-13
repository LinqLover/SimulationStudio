recording
browseRecord: aBlock
	"
	SimulationMessageSendRecorder browseRecord: [Morph new imageForm]
	"

	^ (self record: aBlock) browse