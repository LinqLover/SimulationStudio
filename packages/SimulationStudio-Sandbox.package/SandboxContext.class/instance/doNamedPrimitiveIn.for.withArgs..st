private
doNamedPrimitiveIn: aCompiledMethod for: rcvr withArgs: arguments

	| literal primitiveName accessIndirectors directRcvrAndArgs value |
	literal := aCompiledMethod literalAt: 1.
	literal isArray ifFalse: [^ self activateOperationForbidden: 'FFI not available in simulation'].
	primitiveName := literal second.
	
	accessIndirectors := Array new: arguments size + 1 "withAll: nil".
	literal first
		caseOf: {
			[#B2DPlugin] -> [
				((self objectClass: rcvr) includesBehavior: BalloonEngine)
					ifTrue: ["allowed"]
					ifFalse: [
						(primitiveName = #primitiveSetBitBltPlugin and: [arguments = #('BitBltPlugin')])
							ifTrue: ["This primitive appears to be an assertion only."
								^ self push: rcvr].
						^ self activateOperationForbidden: ('Global B2D primitive {1} not available in simulation' format: {primitiveName})].
				accessIndirectors at: 1 put: #writableObjectFor:].
			[#BitBltPlugin] -> ["allowed"
				accessIndirectors at: 1 put: [:sandbox :object | | writableObject |
					writableObject := sandbox writableObjectFor: object.
					((self objectClass: writableObject) includesBehavior: BitBlt) ifTrue: [ | destForm |
						"Any BitBlt primitive modifies destForm. Thus always sandbox it and its bits. See Form >> #postCopy."
						destForm := self object: writableObject instVarAt: 1 put:
							(sandbox writableObjectFor: (self object: writableObject instVarAt: 1)).
						self object: destForm instVarAt: 1 "bits" put:
							(sandbox writableObjectFor: (self object: destForm instVarAt: 1))].
					writableObject]].
			[#CroquetPlugin] -> ["allowed"].
			[#FilePlugin] -> [^ self activateOperationForbidden: 'FilePlugin not available in simulation'].
			[#FloatArrayPlugin] -> ["allowed"].
			[#Float64ArrayPlugin] -> ["allowed"].
			[#LargeIntegers] -> ["allowed"].
			[#MiscPrimitivePlugin] -> [^ self class primitiveFailTokenFor: nil "use image implementation"].
			[#SimulationStudio] -> ["allowed"].
			[#UUIDPlugin] -> ["allowed"].
			[nil] -> [
				(#('primitiveHighResClock' 'primitiveUtcWithOffset' 'primitiveUtcWithOffset') includes: primitiveName)
					ifTrue: ["allowed"]
					ifFalse: [^ self activateOperationForbidden: ('Unknown primitive {1} not available in simulation' format: {primitiveName})]] }
		otherwise: [:pluginName | ^ self activateOperationForbidden: ('Unknown plugin {1} not available in simulation' format: {pluginName})].
	
	directRcvrAndArgs := self
		access: (arguments copyWithFirst: rcvr)
		indirectors: accessIndirectors.
	value := super
		tryNamedPrimitiveIn: aCompiledMethod
		for: directRcvrAndArgs first
		withArgs: directRcvrAndArgs allButFirst.
	^ (self isPrimFailToken: value)
		ifTrue: [value]
		ifFalse: [self push: value]