accessing
expectedFailureGroups

	^ Dictionary new
		at: #BlockClosureTest put: #(testRunSimulated);
			flag: #todo "Needs attention! For some reason nested SimulationContexts don't do error handling properly";
		at: #ContextTest put: #(testPrimitive83 testPrimitive84 testPrimitive100);
			flag: #upstreamBug "primitiveFailToken is not simulation-transparent. See: http://forum.world.st/Two-new-curious-Context-primitive-questions-td5125779.html#a5125784:~:text=primitiveFailTokenFor"
		yourself