I am a variation of Squeak's traditional MethodFinder that finds all methods for a given set of inputs to match a given output. However, instead of a hardcoded allow-list of selectors, I consider arbitrary messages in the image by evaluating them safely in a SimulationStudio Sandbox. Additionally, I provide a number of advanced configuration options such as reordering arguments (permutationMode), limiting the class hierarchy for search (outerSuperclass), using a predicate or block instead of a constant value for matching message send results (searchMode), and searching in multiple steps (isCompositeSearch) for constructing complex expressions. I also provide some progress variables to support concurrent progress indication.