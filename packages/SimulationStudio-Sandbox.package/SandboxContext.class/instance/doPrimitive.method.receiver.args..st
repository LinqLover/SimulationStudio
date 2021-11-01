private
doPrimitive: primitiveIndex method: meth receiver: rcvr args: arguments
	"See https://wiki.squeak.org/squeak/2121"

	| accessIndirectors selector directRcvrAndArgs |
	self flag: #refactor. "Maybe use a generated array of blocks/symbols instead? Could also be faster."
	accessIndirectors := Array new: arguments size + 1 "withAll: nil".
	primitiveIndex
		caseOf: {
			[18 "primitiveMakePoint"] -> [
				accessIndirectors at: 1 put: #readableObjectFor:.
				selector := #doPrimitiveNew:receiver:args:].
			[38 "primitiveFloatAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[39 "primitiveFloatAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[40 "primitiveAsFloat"] -> [
				accessIndirectors at: 1 put: #readableObjectFor:.
				selector := #doPrimitiveNew:receiver:args:].
			[60 "primitiveAt"] -> [accessIndirectors atLast: 2 put: #readableObjectFor:].
			[61 "primitiveAtPut"] -> [accessIndirectors atLast: 3 put: #writableObjectFor:].
			[62 "primitiveSize"] -> [accessIndirectors atLast: 1 put: #readableObjectFor:].
			[63 "primitiveStringAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[64 "primitiveStringAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[68 "primitiveObjectAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[69 "primitiveObjectAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[70 "primitiveNew"] -> [
				selector := #doPrimitiveNew:receiver:args:.
				accessIndirectors at: 1 put: #readableObjectFor:].
			[71 "primitiveNewWithArg"] -> [
				selector := #doPrimitiveNew:receiver:args:.
				accessIndirectors at: 1 put: #readableObjectFor:].
			[72 "primitiveArrayBecomeOneWay"] -> [
				^ self elements: rcvr forwardIdentityAndHashTo: arguments first].
			[73 "primitiveInstVarAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[74 "primitiveInstVarAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[75 "primitiveIdentityHash"] -> [selector := #doPrimitiveHash:receiver:args:].
			[76 "primitiveStoreStackp"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[77 "primitiveSomeInstance"] -> ["allowed"].
			[78 "primitiveNextInstance"] -> ["allowed"].
			[79 "primitiveNewMethod"] -> [
				selector := #doPrimitiveNew:receiver:args:.
				accessIndirectors at: 1 put: #readableObjectFor:].
			[85 "primitiveSignal"] -> [accessIndirectors at: 1 put: #writableObjectFor: "External processes will not be signaled"].
			[86 "primitiveWait"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[87 "primitiveResume"] -> [^ self activateOperationForbidden: 'Control primitives are disabled in sandbox simulation'].
			[88 "primitiveSuspend"] -> [^ self activateOperationForbidden: 'Control primitives are disabled in sandbox simulation'].
			[89 "primitiveFlushCache"] -> [self flag: #shouldBeImplemented].
			[92 "primitiveSetDisplayMode"] -> [^ self activateOperationForbidden: 'primitiveSetDisplayMode is disabled in sandbox simulation'].
			[93 "primitiveInputSemaphore"] -> [^ self activateOperationForbidden: 'primitiveInputSemaphore is disabled in sandbox simulation'].
			[94 "primitiveGetNextEvent"] -> [^ self activateOperationForbidden: 'primitiveGetNextEvent is disabled in sandbox simulation'].
			[95 "primitiveInputWord"] -> [^ self activateOperationForbidden: 'primitiveInputWord is disabled in sandbox simulation'].
			[97 "primitiveSnapshot"] -> [^ self activateOperationForbidden: 'primitiveSnapshot is disabled in sandbox simulation'].
			[98 "primitiveStoreImageSegment"] -> [^ self activateOperationForbidden: 'Image segment primitives are disabled in sandbox simulation'].
			[99 "primitiveLoadImageSegment"] -> [^ self activateOperationForbidden: 'Image segment primitives are disabled in sandbox simulation'].
			[101 "primitiveBeCursor"] -> [^ self activateOperationForbidden: 'primitiveBeCursor is disabled in sandbox simulation'].
			[102 "primitiveBeDisplay"] -> [^ self activateOperationForbidden: 'primitiveBeDisplay is disabled in sandbox simulation'].
			[103 "primitiveScanCharacters"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[105 "primitiveStringReplace"] -> [^ self class primitiveFailTokenFor: nil "use image implementation"].
			[106 "primitiveScreenSize"] -> ["allowed"].
			[107 "primitiveMouseButtons"] -> ["allowed"].
			[108 "primitiveKbdNext"] -> [^ self activateOperationForbidden: 'primitiveKbdNext is disabled in sandbox simulation'].
			[109 "primitiveKbdPeek"] -> ["allowed"].
			[110 "primitiveIdentical"] -> [accessIndirectors
				atLast: 2 put: #readableObjectFor:;
				atLast: 1 put: #readableObjectFor:].
			[111 "primitiveClass"] -> [accessIndirectors atLast: 1 put: #readableObjectFor:].
			[112 "primitiveBytesLeft"] -> ["allowed"].
			[113 "primitiveQuit"] -> [^ self activateOperationForbidden: 'primitiveQuit is disabled in sandbox simulation'].
			[114 "primitiveExitToDebugger"] -> [
				self flag: #todo. "Should be moved up to Context"
				self halt: 'primitiveExitToDebugger'.
				^ self push: rcvr].
			[115 "primitiveChangeClass"] -> [accessIndirectors
				at: 1 put: #writableObjectFor:;
				at: 2 put: #readableObjectFor:].
			[116 "primitiveFlushCacheByMethod"] -> [
				self flag: #shouldBeImplemented. "This has not been tested. See primitiveFlushCache."
				accessIndirectors at: 1 put: #writableObjectFor:].
			[117 "primitiveExternalCall"] -> [^ self doNamedPrimitiveIn: meth for: rcvr withArgs: arguments].
			[119 "primitiveFlushCacheBySelector"] -> [
				self flag: #shouldBeImplemented. "This has not been tested. See primitiveFlushCache."
				accessIndirectors at: 1 put: #writableObjectFor:].
			[120 "primitiveCalloutToFFI"] -> [^ self doNamedPrimitiveIn: meth for: rcvr withArgs: arguments].
			[121 "primitiveImageName"] -> [^ self activateOperationForbidden: 'primitiveImageName is disabled in sandbox simulation'].
			[124 "primitiveLowSpaceSemaphore"] -> [^ self activateOperationForbidden: 'primitiveLowSpaceSemaphore is disabled in sandbox simulation'].
			[125 "primitiveSignalAtBytesLeft"] -> [^ self activateOperationForbidden: 'primitiveSignalAtBytesLeft is disabled in sandbox simulation'].
			
			[126 "primitiveDeferDisplayUpdates"] -> [^ self class primitiveFailTokenFor: nil "use image implementation"].
			[127 "primitiveShowDisplayRect"] -> [^ self activateOperationForbidden: 'primitiveShowDisplayRect is disabled in sandbox simulation'].
			[128 "primitiveArrayBecome"] -> [^ self elements: rcvr exchangeIdentityWith: arguments first].
			[129 "primitiveSpecialObjectsOop"] -> ["allowed" self flag: #todo "This object is shared with the VM! Forbid manipulation - even when accessed without the primitive"].
			[130 "primitiveFullGC"] -> [^ self activateOperationForbidden: 'GC primitives are disabled in sandbox simulation'].
			[131 "primitiveIncrementalGC"] -> [^ self activateOperationForbidden: 'GC primitives are disabled in sandbox simulation'].
			[132 "primitiveObjectPointsTo"] -> [^ self class primitiveFailTokenFor: nil "use image implementation"].
			[133 "primitiveSetInterruptKey"] -> [^ self activateOperationForbidden: 'primitiveSetInterruptKey is disabled in sandbox simulation'].
			[134 "primitiveInterruptSemaphore"] -> [^ self activateOperationForbidden: 'primitiveInterruptSemaphore is disabled in sandbox simulation'].
			[136 "primitiveSignalAtMilliseconds"] -> [^ self activateOperationForbidden: 'primitiveSignalAtMilliseconds is disabled in sandbox simulation'].
			[138 "primitiveSomeObject"] -> ["allowed"].
			[139 "primitiveNextObject"] -> ["allowed"].
			[140 "primitiveBeep"] -> [^ self activateOperationForbidden: 'primitiveBeep is disabled in sandbox simulation'].
			[141 "primitiveClipboardText"] -> [^ self activateOperationForbidden: 'primitiveClipboardText is disabled in sandbox simulation'].
			[142 "primitiveVMPath"] -> ["allowed"].
			[143 "primitiveShortAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[144 "primitiveShortAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[145 "primitiveConstantFill"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[148 "primitiveClone"] -> [
				selector := #doPrimitiveNew:receiver:args:.
				accessIndirectors at: 1 put: #readableObjectFor:].
			[149 "primitiveGetAttribute"] -> ["allowed"].
		}
		otherwise: [ | morePrimitive moreResult |
			self flag: #vmCapability. "Squeak 5.3/ClosureV3 encoder cannot handle more literals in one method..."
			morePrimitive := true.
			moreResult := self doMorePrimitive: primitiveIndex method: meth receiver: rcvr args: arguments ifAbsent: [
				morePrimitive := false.
				(primitiveIndex >= 250 and: [primitiveIndex <= 254]) "VM implementor primitives"
					ifTrue: [^ self activateOperationForbidden: 'VM implementor primitives are disabled in sandbox simulation'].
				(primitiveIndex >= 264 and: [primitiveIndex <=  519]) "primitiveLoadInstVar"
					ifTrue: [accessIndirectors at: 1 put: #readableObjectFor:]].
			morePrimitive ifTrue: [^ moreResult]].
	
	self flag: #forLater. "Rethink several restrictions, e.g. instance enumeration, process signaling etc. Can we simulate sum of them?"
	
	directRcvrAndArgs := self
		access: (arguments copyWithFirst: rcvr)
		indirectors: accessIndirectors.
	selector ifNotNil: [
		^ self
			perform: selector
			with: primitiveIndex
			with: directRcvrAndArgs first
			with: directRcvrAndArgs allButFirst].
	
	^ super
		doPrimitive: primitiveIndex
		method: meth
		receiver: directRcvrAndArgs first
		args: directRcvrAndArgs allButFirst