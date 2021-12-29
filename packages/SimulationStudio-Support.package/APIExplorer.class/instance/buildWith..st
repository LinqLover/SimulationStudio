toolbuilder
buildWith: builder

	| spec |
	spec := self buildWindowWith: builder specs: {
		(0 @ 0 corner: 0.35 @ 0.2) -> [self buildClassList: builder].
		(0 @ 0.2 corner: 0.35 @ 0.6) -> [self buildCategoryList: builder].
		(0.35 @ 0 corner: 1 @ 0.6) -> [self buildMessageList: builder].
		(0 @ 0.6 corner: 1 @ 1) -> [self buildCodePaneWith: builder].
	}.
	^ spec buildWith: builder