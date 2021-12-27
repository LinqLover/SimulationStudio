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
			[158 "primitiveCompareWith"] -> [^ self class primitiveFailTokenFor: nil "use image implementation"].
			[160 "primitiveAdoptInstance"] -> [accessIndirectors
				at: 1 put: #readableObjectFor:;
				at: 2 put: #writableObjectFor:].
			[161 "primitiveSetOrHasIdentityHash"] -> [self shouldBeImplemented: 'primitiveSetOrHasIdentityHash'].
			[163 "primitiveGetImmutability"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[164 "primitiveSetImmutability"] -> [selector := #doPrimitiveSetImmutability:receiver:args:].
			[165 "primitiveIntegerAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[166 "primitiveIntegerAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[167 "primitiveYield"] -> [^ self activateOperationForbidden: 'Control primitives are disabled in sandbox simulation'].
			[168 "primitiveCopyObject"] -> [^ self class primitiveFailTokenFor: nil "use image implementation"].
			[169 "primitiveNotIdentical"] -> [accessIndirectors
				at: 1 put: #readableObjectFor:;
				at: 2 put: #readableObjectFor:].
			[170 "primitiveAsCharacter"] -> [
				accessIndirectors at: 1 put: #readableObjectFor:.
				selector := #doPrimitiveNew:receiver:args:].
			[171 "primitiveImmediateAsInteger"] -> [
				accessIndirectors at: 1 put: #readableObjectFor:.
				selector := #doPrimitiveNew:receiver:args:].
			[172 "primitiveFetchNextMourner"] -> [self flag: #reconsider].
			[173 "primitiveSlotAt"] -> [accessIndirectors atLast: 2 put: #readableObjectFor:].
			[174 "primitiveSlotAtPut"] -> [accessIndirectors atLast: 3 put: #writableObjectFor:].
			[175 "primitiveBehaviorHash"] -> [#doPrimitiveHash:receiver:args:].
			[176 "primitiveMaxIdentityHash"] -> ["allowed"].
			[177 "primitiveAllInstances"] -> ["allowed"].
			[178 "primitiveAllObjects"] -> ["allowed"].
			[180 "primitiveGrowMemoryByAtLeast"] -> [^ self activateOperationForbidden: 'primitiveGrowMemoryByAtLeast is disabled in sandbox simulation'].
			[181 "primitiveSizeInBytesOfInstance"] -> [
				self flag: #shouldBeImplemented.
				^ self activateOperationForbidden: 'primitiveSizeInBytesOfInstance is disabled in sandbox simulation'].
			[182 "primitiveSizeInBytes"] -> [
				self flag: #shouldBeImplemented.
				^ self activateOperationForbidden: 'primitiveSizeInBytesOfInstance is disabled in sandbox simulation'].
			[183 "primitiveIsPinned"] -> [^ self activateOperationForbidden: 'Pinning primitives are disabled in sandbox simulation'].
			[184 "primitivePin"] -> [
				self flag: #forLater. "We could simulate that, too. Maybe interesting for TelegramSmalltalkSession?"
				^ self activateOperationForbidden: 'Pinning primitives are disabled in sandbox simulation'].
			[185 "primitiveExitCriticalSection"] -> [^ self activateOperationForbidden: 'Critical section primitives are disabled in sandbox simulation'].
			[186 "primitiveEnterCriticalSection"] -> [^ self activateOperationForbidden: 'Critical section primitives are disabled in sandbox simulation'].
			[187 "primitiveTestAndSetOwnershipOfCriticalSection"] -> [^ self activateOperationForbidden: 'Critical section primitives are disabled in sandbox simulation'].
			[195 "primitiveFindNextUnwindContext"] -> [
				"Note: Usually, this primitive will not be called for thisContext during simulation. However, if that's what the client is after, don't fall for it but use the image implementation."
				^ self class primitiveFailTokenFor: nil].
			[196 "primitiveTerminateTo"] -> [
				"Note: Usually, this primitive will not be called for thisContext during simulation. However, if that's what the client is after, don't fall for it but use the image implementation."
				^ self class primitiveFailTokenFor: nil].
			[197 "primitiveFindHandlerContext"] -> [
				"Note: Usually, this primitive will not be called for thisContext during simulation. However, if that's what the client is after, don't fall for it but use the image implementation."
				^ self class primitiveFailTokenFor: nil].
			[210 "primitiveContextAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[211 "primitiveContextAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[212 "primitiveContextSize"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[213 "primitiveContextXray"] -> [self shouldBeImplemented: 'primitiveContextXray'].
			[214 "primitiveVoidVMState"] -> [self shouldBeImplemented: 'primitiveVoidVMState'].
			[215 "primitiveFlushCacheByMethod"] -> [
				self flag: #shouldBeImplemented. "This has not been tested. See primitiveFlushCache."
				accessIndirectors at: 1 put: #writableObjectFor:].
			[230 "primitiveRelinquishProcessor"] -> [^ self class primitiveFailTokenFor: nil "optional primitive, just skip it"].
			[231 "primitiveForceDisplayUpdate"] -> [^ self class primitiveFailTokenFor: nil "use image implementation"].
			[232 "primitiveFormPrint"] -> [^ self class primitiveFailTokenFor: nil "don't support"].
			[233 "primitiveSetFullScreen"] -> [^ self activateOperationForbidden: 'primitiveSetFullScreen is disabled in sandbox simulation'].
			[238 "primitiveFloatAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[239 "primitiveFloatAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[242 "primitiveSignalAtUTCMicroseconds"] -> [^ self activateOperationForbidden: 'primitiveSignalAtMilliseconds is disabled in sandbox simulation'].
			[243 "primitiveUpdateTimezone"] -> [^ self class primitiveFailTokenFor: nil "don't support"].
			[247 "primitiveSnapshotEmbedded"] -> [^ self activateOperationForbidden: 'primitiveSnapshotEmbedded is disabled in sandbox simulation'].
			[248 "primitiveArrayBecomeOneWayNoCopyHash"] -> [
				^ self elements: rcvr forwardIdentityTo: arguments first].
			[249 "primitiveArrayBecomeOneWayCopyHash"] -> [
				^ self elements: rcvr forwardIdentityTo: arguments first copyHash: arguments second].
			[570 "primitiveFlushExternalPrimitives"] -> [^ self activateOperationForbidden: 'primitiveFlushExternalPrimitives is disabled in sandbox simulation'].
			[571 "primitiveUnloadModule"] -> [^ self activateOperationForbidden: 'primitiveUnloadModule is disabled in sandbox simulation'].
			[572 "primitiveListBuiltinModule"] -> ["allowed"].
			[573 "primitiveListExternalModule"] -> ["allowed"].
		}
		otherwise: [
			(primitiveIndex >= 250 and: [primitiveIndex <= 254]) "VM implementor primitives"
				ifTrue: [^ self activateOperationForbidden: 'VM implementor primitives are disabled in sandbox simulation'].
			(primitiveIndex >= 264 and: [primitiveIndex <=  519]) "primitiveLoadInstVar"
				ifTrue: [accessIndirectors at: 1 put: #readableObjectFor:]].
	
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