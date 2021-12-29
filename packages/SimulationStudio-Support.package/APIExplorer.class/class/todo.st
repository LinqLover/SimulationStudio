as yet unclassified
todo

	self flag: #todo.
	'CURRENT STATE:
	- minimal working prototype!
	- next steps:
		- optimization: implement asynchronous message evaluation in the background
		- enhancement: detect and display side effects?
			prototype: (Sandbox new evaluate: [Morph new openInWorld]; exportMemory) manipulatedObjects size > 1
		- non-unary messages: either hide or try to generate arguments - either via heuristics (tempNames, allInstances, random values), via source code mining, or via generative code coverage. display different arguments sets in a tree structure.'