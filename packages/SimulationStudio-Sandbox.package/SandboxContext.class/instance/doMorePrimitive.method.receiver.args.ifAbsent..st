private
doMorePrimitive: primitiveIndex method: meth receiver: rcvr args: arguments ifAbsent: absentBlock

	| accessIndirectors selector directRcvrAndArgs |
	self flag: #refactor. "Maybe use a generated array of blocks/symbols instead? Could also be faster."
	accessIndirectors := Array new: arguments size + 1 "withAll: nil".
	primitiveIndex
		caseOf: {
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
			[238] -> [self isThisEverCalled: 'serial port primitive?'].
			[239] -> [self isThisEverCalled: 'serial port primitive?'].
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
			^ absentBlock value].
	
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