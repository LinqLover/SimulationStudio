private-exceptions - patching
findNextHandlerContextStarting
	"Overriden without primitive call because VM cannot handle custom contexts."

	| ctx |
	ctx := self.
		[ctx isHandlerContext ifTrue:[^ctx].
		(ctx := ctx sender) == nil ] whileFalse.
	^nil