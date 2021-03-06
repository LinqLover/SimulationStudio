stepping
registerStep

	stepCount := stepCount + 1.
	stepLimit ifNil: [^ self].
	stepCount >= stepLimit ifTrue: [
		SandboxError signal: 'Step limit exceeded'].