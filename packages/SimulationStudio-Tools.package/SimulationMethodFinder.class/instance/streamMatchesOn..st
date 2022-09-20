finding
streamMatchesOn: aWriteStream

	| queueIndex queueSizeForCurrentDepth |
	currentSearchQueue := OrderedCollection with:
		{self receiverAndArguments collect: [:eachArgument |
			SimulationMethodFinderExpression leaf: eachArgument].
		0}.
	
	currentDepthProgress := 0.
	currentDepthIndex := Float negativeInfinity.
	[currentSearchQueue isEmpty] whileFalse:
		[| searchItem availableRcvrargs recursionDepth rcvrargSubsets |
		searchItem := currentSearchQueue removeFirst.
		availableRcvrargs := searchItem first.
		recursionDepth := searchItem second.
		
		"Update progress variables"
		recursionDepth > currentDepthIndex ifTrue:
			[currentDepthIndex := recursionDepth.
			currentDepthStartTime := DateAndTime now.
			queueSizeForCurrentDepth := currentSearchQueue size.
			queueIndex := 0].
		currentDepthProgress := queueIndex / (queueSizeForCurrentDepth + 1).
		queueIndex := queueIndex + 1.
		
		"1) For all subsets of receiver/arguments ..."
		rcvrargSubsets := self isCompositeSearch
			ifFalse: [{availableRcvrargs}]
			ifTrue:
				[(Array new: 2 ** availableRcvrargs size streamContents: [:stream |
					availableRcvrargs simAllOrderedSubsetsDo: [:rcvrargSubset | stream nextPut: rcvrargSubset]])
						reversed].
		rcvrargSubsets withIndexDo: [:rvrargSubset :rvrargSubsetIndex |
			| omittedRcvrargs usedRvrargs usedReceiverCount |
			omittedRcvrargs := availableRcvrargs difference: rvrargSubset.
			usedRvrargs := rvrargSubset asArray.
			
			"2) For each possible receiver from the current set ..."
			usedReceiverCount := self permutationMode = #receiverAndArguments
				ifTrue: [usedRvrargs size]
				ifFalse: [1 min: usedRvrargs size].
			1 to: usedReceiverCount do: [:usedReceiverIndex |
				| usedReceiver usedReceiverValue usedArgSet selectors usedArgsPermutations |
				usedReceiver := usedRvrargs at: usedReceiverIndex.
				usedReceiverValue := usedReceiver value.
				usedArgSet := (usedRvrargs first: usedReceiverIndex - 1)
					, (usedRvrargs allButFirst: usedReceiverIndex).
				
				"3) For each selector that is understood by this receiver ..."
				selectors := (self outerSuperclass isNil or: [usedReceiverValue isKindOf: self outerSuperclass])
					ifFalse: [#()]
					ifTrue:
						[((usedReceiverValue class allSelectorsBelow: self outerSuperclass)
							select: [:sel | sel numArgs = usedArgSet size])
								sorted: [:sel | self class popularityOfSelector: sel] descending].
				
				"4) For each permutation of the remaining arguments from the set ..."
				usedArgsPermutations := self permutationMode
					ifNil: [{usedArgSet}]
					ifNotNil:
						[Array new: usedArgSet size factorial streamContents: [:stream |
							usedArgSet permutationsDo: [:usedArgs | stream nextPut: usedArgs copy]]].
				selectors withIndexDo: [:selector :selectorIndex |
					usedArgsPermutations withIndexDo: [:usedArgs :usedArgsIndex |
						| usedArgValues expression hasMatched |
						usedArgValues := usedArgs collect: [:eachArgument | eachArgument value].
						
						expression := SimulationMethodFinderExpression
							selector: selector
							receiver: usedReceiver
							arguments: usedArgs.
						transcripter ifNotNil: [transcripter showln: expression].
						hasMatched := false.
						
						self flag: #forLater. "Add option to omit arguments"
						omittedRcvrargs ifEmpty:
							["a) Send message and test the result"
							self trySendAndMatch: usedReceiverValue selector: selector arguments: usedArgValues ifMatch: [:result |
								transcripter ifNotNil: [transcripter showln: '	match: '; show: result].
								aWriteStream nextPut:
									(expression withValue: result)]].
						
						(self isCompositeSearch and: [hasMatched not "avoid useless loops/cycles"]) ifTrue:
							["b) Send message and store the intermediate result in the queue"
							| matchResult |
							matchResult := self trySend: usedReceiverValue selector: selector arguments: usedArgValues ifSuccess: [:result |
								transcripter ifNotNil: [transcripter showln: '	intermediate: '; show: result].
								result == usedReceiverValue ifFalse:
									[transcripter ifNotNil: [transcripter show: ' (enqueue)'].
									self flag: #forLater. "Add option to reuse arguments"
									currentSearchQueue addLast:
										{omittedRcvrargs copyWithFirst:
											(expression withValue: result).
										recursionDepth + 1}]]].
						
						transcripter ifNotNil: [transcripter show: '.'].
						
						"Update progress variables"
						currentDepthIndex = 0 ifTrue:
							[currentDepthProgress := selectorIndex / selectors size
								- 1 + usedReceiverIndex / usedReceiverCount
								- 1 + rvrargSubsetIndex / rcvrargSubsets size
								- 1 + queueIndex / (queueSizeForCurrentDepth + 1)].
						
						Processor yield]]]]].