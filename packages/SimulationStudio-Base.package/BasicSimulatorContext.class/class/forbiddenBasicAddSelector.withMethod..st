template - accessing method dictionary
forbiddenBasicAddSelector: selector withMethod: aCompiledMethod
	"This message is sent to read-only context classes!"
	
	selector ifEmpty:
		["edge case for fallback in Object>>#withArgs:executeMethod:"
		^ super basicAddSelector: selector withMethod: aCompiledMethod].
	
	^ NotImplemented signal: 'You shall not want to edit this uniclass itself. Instead, add the new method to SimulationContext or BasicSimulatorContext, or implement a capability/delegator on SimulatorContext and then restart the simulator.'