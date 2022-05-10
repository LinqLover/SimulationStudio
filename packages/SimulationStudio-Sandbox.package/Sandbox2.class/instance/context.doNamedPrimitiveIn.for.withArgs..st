controlling
context: aContext doNamedPrimitiveIn: aCompiledMethod for: rcvr withArgs: arguments

	| literal primitiveName accessIndirectors directRcvrAndArgs value |
	literal := aCompiledMethod literalAt: 1.
	literal isArray ifFalse: [^ self context: aContext activateOperationForbidden: 'FFI not available in simulation'].
	primitiveName := literal second.
	
	accessIndirectors := Array new: arguments size + 1 "withAll: nil".
	literal first
		caseOf: {
			[#B2DPlugin] -> [
				((aContext objectClass: rcvr) includesBehavior: BalloonEngine)
					ifTrue: ["allowed"]
					ifFalse: [
						(primitiveName = #primitiveSetBitBltPlugin and: [arguments = #('BitBltPlugin')])
							ifTrue: ["This primitive appears to be an assertion only."
								^ aContext push: rcvr].
						^ self context: aContext activateOperationForbidden: ('Global B2D primitive {1} not available in simulation' format: {primitiveName})].
				accessIndirectors at: 1 put: #writableObjectFor:].
			[#BitBltPlugin] -> ["allowed"
				accessIndirectors at: 1 put: [:sandbox :object | | writableObject |
					writableObject := sandbox writableObjectFor: object.
					((aContext objectClass: writableObject) includesBehavior: BitBlt) ifTrue: [ | destForm |
						"Any BitBlt primitive modifies destForm. Thus always sandbox it and its bits. See Form >> #postCopy."
						destForm := aContext object: writableObject instVarAt: 1 put:
							(sandbox writableObjectFor: (aContext object: writableObject instVarAt: 1)).
						aContext object: destForm instVarAt: 1 "bits" put:
							(sandbox writableObjectFor: (aContext object: destForm instVarAt: 1))].
					writableObject]].
			[#CroquetPlugin] -> ["allowed"].
			[#FilePlugin] -> [^ self context: aContext activateOperationForbidden: 'FilePlugin not available in simulation'].
			[#FloatArrayPlugin] -> [^ self context: aContext primitiveFailTokenFor: nil "use image implementation"].
			[#Float64ArrayPlugin] -> [^ self context: aContext primitiveFailTokenFor: nil "use image implementation"].
			[#LargeIntegers] -> ["allowed"].
			[#MiscPrimitivePlugin] -> [^ self context: aContext primitiveFailTokenFor: nil "use image implementation"].
			[#SimulationStudio] -> ["allowed"].
			[#UUIDPlugin] -> ["allowed"].
			[nil] -> [
				(#('primitiveHighResClock' 'primitiveUtcWithOffset' 'primitiveUtcWithOffset') includes: primitiveName)
					ifTrue: ["allowed"]
					ifFalse: [^ self context: aContext activateOperationForbidden: ('Unknown primitive {1} not available in simulation' format: {primitiveName})]] }
		otherwise: [:pluginName | ^ self context: aContext activateOperationForbidden: ('Unknown plugin {1} not available in simulation' format: {pluginName})].
	
	directRcvrAndArgs := self
		access: (arguments copyWithFirst: rcvr)
		indirectors: accessIndirectors.
	value := aContext
		flag: #horrible; "design issue: We cannot enter a different chain of responsibility at a custom place. What shall we do now? Manual recursion detection? Super hooks on SimulatorContext? Despair???"
		perform: #tryNamedPrimitiveIn:for:withArgs:
			withArguments: {aCompiledMethod. directRcvrAndArgs first. directRcvrAndArgs allButFirst}
			inSuperclass: SimulationContext.
	^ (aContext isPrimFailToken: value)
		ifTrue: [value]
		ifFalse: [aContext push: value]