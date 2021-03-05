private-exceptions - patching
findNextUnwindContextUpTo: aContext
	"Overriden without primitive call because VM cannot handle custom contexts."

	| ctx |
	ctx := self.
	[(ctx := ctx sender) == nil or: [ctx == aContext]] whileFalse:
		[ ctx isUnwindContext ifTrue: [^ctx]].
	^nil