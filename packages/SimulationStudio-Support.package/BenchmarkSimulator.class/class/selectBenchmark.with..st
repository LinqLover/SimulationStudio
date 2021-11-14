benchmarking
selectBenchmark: workloads with: operators

	^ self
		benchmark: (workloads atAllIndices:
			((Project uiManager
				chooseMultipleFrom: workloads keys
				title: 'Choose workloads')
					ifNil: [^ nil]))
		with: (operators atAllIndices:
			((Project uiManager
				chooseMultipleFrom: operators keys
				title: 'Choose operators')
					ifNil: [^ nil]))