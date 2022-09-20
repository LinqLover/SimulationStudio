as yet unclassified
todo

	self flag: #todo.
	'CURRENT STATE:
	- minimal working prototype!
	- next steps:
		- optimization: implement asynchronous message evaluation in the background
		- side effects: add explaining tooltip and describe side effects? See also: https://github.com/LinqLover/squeak-tracedebugger/issues/74#:~:text=Explain%20side%20effects%20in%20a%20sandbox
		- non-unary messages: either hide or try to generate arguments - either via heuristics (tempNames, allInstances, random values), via source code mining, or via generative code coverage. display different arguments sets in a tree structure.
	- strange bug: #() exploreProtocol and view #identityIndexOf: will cause the display to flash'