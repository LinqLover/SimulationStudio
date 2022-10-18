documentation
todo

	"Ideas for further features:
	* Omit or reuse (for composite search) arguments (place them n<>1 times in the final expression)
	* Generate arguments (symbolic execution?)
	* Specify multiple samples for testing
	* For #sendingPredicate: Make it possible to reevaluate the inputs text together with the predicate for each selector?
	* Use tool for existing objects (drag in to set workspace variables?)
	
	Current limitations:
	* Side effects for composite search are not preserved (i.e., ((an OrderedCollection(1)) removeAll) size will never be found) - could be solved by importing/exporting SandboxMemorys
	* For #sendingPredicate: Only blocks within receiver/arguments may refer to context provided by the predicate"