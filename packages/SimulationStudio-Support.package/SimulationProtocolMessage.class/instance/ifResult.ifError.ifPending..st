accessing
ifResult: resultBlock ifError: errorBlock ifPending: pendingBlock

	^ self state caseOf:
		{[nil] -> [pendingBlock value].
		[#done] -> [resultBlock value: result].
		[#error] -> [errorBlock value: error]}