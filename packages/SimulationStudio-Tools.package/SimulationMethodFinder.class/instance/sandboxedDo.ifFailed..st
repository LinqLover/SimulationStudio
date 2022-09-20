private
sandboxedDo: aBlock ifFailed: failBlock

	| sandbox |
	sandbox := self sandboxClass new.
	sandbox stepLimit: 100000.
	^ [sandbox
		evaluate: aBlock
		ifFailed: failBlock]
			on: SandboxError "e.g., stepLimit exceeded" do: failBlock
			on: Error, Warning do: [:ex |
				self assuredTranscripter
					openIfNone; showln: ex.
				failBlock value]