private
sendBasicMessage: receiver

	^ (SimulationMsrContext newFrom: thisContext)
		recorder: self;
		runSimulated: [receiver value]