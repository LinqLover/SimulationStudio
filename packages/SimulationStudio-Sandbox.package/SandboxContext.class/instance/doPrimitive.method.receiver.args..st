private
doPrimitive: primitiveIndex method: meth receiver: rcvr args: arguments
	"See https://wiki.squeak.org/squeak/2121"

	| accessIndirectors selector directRcvrAndArgs |
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
			[60 "primitiveAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[61 "primitiveAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[62 "primitiveSize"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
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
			[79 "primitiveNewMethod"] -> [
				selector := #doPrimitiveNew:receiver:args:.
				accessIndirectors at: 1 put: #readableObjectFor:].
			[85 "primitiveSignal"] -> [accessIndirectors at: 1 put: #writableObjectFor: "External processes will not be signaled"].
			[86 "primitiveWait"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[88 "primitiveSuspend"] -> [^ self activateOperationForbidden: 'Control primitives are disabled in sandbox simulation'].
			[89 "primitiveFlushCache"] -> [self flag: #shouldBeImplemented].
			[105 "primitiveStringReplace"] -> [^ self class primitiveFailTokenFor: nil "use image implementation"].
			[110 "primitiveIdentical"] -> [accessIndirectors
				at: 1 put: #readableObjectFor:;
				at: 2 put: #readableObjectFor:].
			[111 "primitiveClass"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[115 "primitiveChangeClass"] -> [accessIndirectors
				at: 1 put: #readableObjectFor:;
				at: 2 put: #writableObjectFor:].
			[116 "primitiveFlushCacheByMethod"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[117 "primitiveExternalCall"] -> [^ self doNamedPrimitiveIn: meth for: rcvr withArgs: arguments].
			[119 "primitiveFlushCacheBySelector"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[128 "primitiveArrayBecome"] -> [
				^ self elements: rcvr exchangeIdentityWith: arguments first].
			[143 "primitiveShortAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[144 "primitiveShortAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[148 "primitiveClone"] -> [
				selector := #doPrimitiveNew:receiver:args:.
				accessIndirectors at: 1 put: #readableObjectFor:].
			"todo: everything after 150"
			[158 "primitiveCompareWith"] -> [^ self class primitiveFailTokenFor: nil "use image implementation"].
			[161 "primitiveSetOrHasIdentityHash"] -> [self shouldBeImplemented].
			[165 "primitiveIntegerAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[166 "primitiveIntegerAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[168 "primitiveCopyObject"] -> [^ self class primitiveFailTokenFor: nil "use image implementation"].
			[173 "primitiveSlotAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[174 "primitiveSlotAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[175 "primitiveBehaviorHash"] -> [#doPrimitiveHash:receiver:args:].
			[185 "primitiveExitCriticalSection"] -> [^ self activateOperationForbidden: 'Critical section primitives are disabled in sandbox simulation'].
			[186 "primitiveEnterCriticalSection"] -> [^ self activateOperationForbidden: 'Critical section primitives are disabled in sandbox simulation'].
			[187 "primitiveTestAndSetOwnershipOfCriticalSection"] -> [^ self activateOperationForbidden: 'Critical section primitives are disabled in sandbox simulation'].
			[210 "primitiveContextAt"] -> [accessIndirectors at: 1 put: #readableObjectFor:].
			[211 "primitiveContextAtPut"] -> [accessIndirectors at: 1 put: #writableObjectFor:].
			[248 "primitiveArrayBecomeOneWayNoCopyHash"] -> [
				^ self elements: rcvr forwardIdentityTo: arguments first].
			[249 "primitiveArrayBecomeOneWayCopyHash"] -> [
				^ self elements: rcvr forwardIdentityTo: arguments first copyHash: arguments second].
		}
		otherwise: [
			(primitiveIndex >= 264 and: [primitiveIndex <=  519]) "primitiveLoadInstVar"
				ifTrue: [accessIndirectors at: 1 put: #readableObjectFor:]].
	
	self flag: #forLater. "restrict instance enumeration, disable perform etc., process signaling etc., I/O, FFI etc., primitive by index/name, quit, GC, image saving, critsect/semaphores, ..."
	
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