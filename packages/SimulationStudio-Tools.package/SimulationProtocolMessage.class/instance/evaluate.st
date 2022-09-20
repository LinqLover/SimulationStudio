actions
evaluate

	| sandbox |
	sandbox := self sandboxClass new.
	result := [[sandbox
		evaluate: [self perform]
		ifFailed: [:ex |
			error := ex.
			state := #error.
			nil]]
				valueWithin: 1 second
				onTimeout: [self error: #timeout]]
					on: Error do: [:ex |
						error := ex.
						state := #error.
						nil].
	state ifNil: [state := #done].
	hasSideEffects := sandbox exportMemory manipulatedObjects size > (1 flag: #workaround "closure vector in Sandbox >> #evaluate:on:do:").