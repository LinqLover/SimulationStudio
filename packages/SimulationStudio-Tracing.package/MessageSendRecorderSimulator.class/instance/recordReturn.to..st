private
recordReturn: value to: aContext

	| recordBlock |
	recordBlock := recordBlocks removeKey: aContext ifAbsent: [
		Transcript showln: 'Returning from unrecorded message send: '; show: aContext.
		^ self].
	
	recordBlock value: value value: aContext.