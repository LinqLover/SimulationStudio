*SimulationStudio-Base-instance creation
fromSimulationContext: aContext

	| newContext |
	newContext := self newForMethod: aContext method.
	newContext
		setSender: aContext sender
		receiver: aContext receiver
		method: aContext method
		closure: aContext closure
		startpc: aContext pc.
	newContext stackPtr timesRepeat: [newContext pop].
	(aContext as: Array) do: [:ea |
		newContext push: ea].
	^ newContext