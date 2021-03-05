private
doNamedPrimitiveIn: aCompiledMethod for: rcvr withArgs: arguments

	| literal primitiveName accessIndirectors directRcvrAndArgs value |
	literal := aCompiledMethod literalAt: 1.
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
				accessIndirectors at: 1 put: #writableObjectFor:].
			[#FilePlugin] -> [^ self activateOperationForbidden: 'FilePlugin not available in simulation'].
			[#LargeIntegers] -> ["allowed"].
			[#MiscPrimitivePlugin] -> [^ self class primitiveFailTokenFor: nil "use image implementation"].
			[#SimulationStudio] -> ["allowed"].
			[nil] -> [
				(#('primitiveHighResClock' 'primitiveUtcWithOffset' 'primitiveUtcWithOffset') includes: primitiveName)
					ifTrue: ["allowed"]
					ifFalse: [^ self activateOperationForbidden: ('Unknown primitive {1} not available in simulation' format: {primitiveName})]] }
		otherwise: [":pluginName |" ^ self activateOperationForbidden: ('Unknown plugin {1} not available in simulation' format: {literal first})].
	
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