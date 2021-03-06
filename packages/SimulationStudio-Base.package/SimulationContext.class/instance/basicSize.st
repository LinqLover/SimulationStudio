accessing - stack patching
basicSize

	self flag: #hacked. "for newInstanceFrom:variable:size:map: during recompilation. Do we need this?"
	^ stack ifNil: [0] ifNotNil: [stack size]