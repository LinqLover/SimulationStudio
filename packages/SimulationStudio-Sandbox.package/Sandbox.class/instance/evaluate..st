evaluating
evaluate: aBlock

	^ self
		evaluate: aBlock
		ifFailed: [:ex | SandboxError new
			messageText: 'Exception from simulated code: ' , ex;
			tag: ex;
			signal]