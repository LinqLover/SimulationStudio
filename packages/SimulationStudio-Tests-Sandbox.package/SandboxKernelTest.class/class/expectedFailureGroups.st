accessing
expectedFailureGroups

	^ Dictionary new
		at: #BlockClosureTest put: #(testRunSimulated);
		flag: #todo "Needs attention! For some reason nested SimulationContexts don't do error handling properly";
		yourself