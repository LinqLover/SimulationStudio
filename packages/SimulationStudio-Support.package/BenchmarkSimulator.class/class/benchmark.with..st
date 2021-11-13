benchmarking
benchmark: workloads with: operators

	^ ((workloads associations
		collect: [:workloadAssoc | workloadAssoc key -> ((operators associations
			collect: [:operatorAssoc | operatorAssoc key ->
				(BenchmarkSimulator record: [operatorAssoc value value: workloadAssoc value])]
			displayingProgress: [:operatorAssoc | operatorAssoc key])
				as: OrderedDictionary)]
		displayingProgress: [:workloadAssoc | workloadAssoc key])
			as: OrderedDictionary)
			
				explore "would be too annoying to wait an hour for the benchmarks to complete and then missing to store the output somewhere..."